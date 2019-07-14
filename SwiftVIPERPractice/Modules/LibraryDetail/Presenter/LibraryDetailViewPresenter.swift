//
//  LibraryDetailViewPresenter.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/14.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation
import SwiftVIPERPracticeDataStore

final class LibraryDetailViewPresenter {
    
    private weak var view: LibraryDetailView?
    private let interactor: LibraryDetailUsecase
    private let router: LibraryDetailWireframe
    private let library: Library
    
    init(view: LibraryDetailView, interactor: LibraryDetailUsecase, router: LibraryDetailWireframe, library: Library) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.library = library
        print(library)
    }
}

extension LibraryDetailViewPresenter: LibraryDetailViewPresentation {
    
}

extension LibraryDetailViewPresenter: LibraryDetailInteractorDelegate {
    
}
