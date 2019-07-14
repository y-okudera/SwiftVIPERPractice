//
//  HomeRouter.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import SwiftVIPERPracticeDataStore
import UIKit

final class HomeRouter {
    
    weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // 依存関係の解決をする
    static func assembleModules() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: .main)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        let presenter = HomeViewPresenter(view: view, interactor: interactor, router: router)
        
        // Interactorの通知先を設定
        interactor.output = presenter
        // ViewにPresenterを設定
        view.presenter = presenter
        
        view.navigationItem.title = "図書館検索"
        return view
    }
}

extension HomeRouter: HomeWireframe {
    
    func showLibraryDetail(_ library: Library) {
        let libraryDetailView = LibraryDetailRouter.assembleModules(library: library)
        viewController?.navigationController?.pushViewController(libraryDetailView, animated: true)
    }
}
