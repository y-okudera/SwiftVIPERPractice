//
//  HomeViewPresenter.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation
import SwiftVIPERPracticeDataStore

final class HomeViewPresenter {
    
    // View, Interactor, Routerへのアクセスはprotocolを介して行う
    private weak var view: HomeView?
    private let interactor: HomeUsecase
    private let router: HomeWireframe
    
    private var prefText: String = "" {
        didSet {
            guard !prefText.isEmpty else {
                self.libraries = []
                return
            }

            // 図書館APIリクエスト
            interactor.fetchLibraries(pref: prefText)
        }
    }
    
    private(set) var libraries: [Library] = [] {
        didSet {
            view?.reloadData(libraries: libraries)
        }
    }
    
    init(view: HomeView, interactor: HomeUsecase, router: HomeWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomeViewPresenter: HomeViewPresentation {
    
    func viewDidLoad() {
        #warning("DBから前回の検索結果を取得し、Viewに反映させる")
    }
    
    func prefTextValueChanged(prefText: String) {
        self.prefText = prefText
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < libraries.count else {
            return
        }
        let library = libraries[indexPath.row]
        router.showLibraryDetail(library)
    }
}

extension HomeViewPresenter: HomeInteractorDelegate {
    
    func didFetchLibraries(libraries: [Library]) {
        self.libraries = libraries
    }
    
    func didFailWithAPIError(apiError: APIError) {
        view?.showAlert(message: apiError.message)
    }
}
