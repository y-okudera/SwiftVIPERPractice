//
//  LibraryDetailRouter.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/14.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import SwiftVIPERPracticeDataStore
import UIKit

final class LibraryDetailRouter {
    
    weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // 依存関係の解決をする
    static func assembleModules(library: Library) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "LibraryDetailViewController", bundle: .main)
        let view = storyboard.instantiateViewController(withIdentifier: "LibraryDetailViewController") as! LibraryDetailViewController
        let interactor = LibraryDetailInteractor()
        let router = LibraryDetailRouter(viewController: view)
        let presenter = LibraryDetailViewPresenter(view: view, interactor: interactor, router: router, library: library)
        
        // Interactorの通知先を設定
        interactor.output = presenter
        // ViewにPresenterを設定
        view.presenter = presenter
        
        view.navigationItem.title = library.formal
        return view
    }
}

extension LibraryDetailRouter: LibraryDetailWireframe {
    
}
