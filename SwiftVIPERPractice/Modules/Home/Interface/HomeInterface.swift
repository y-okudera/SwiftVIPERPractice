//
//  HomeInterface.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/14.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit
import SwiftVIPERPracticeDataStore

// MARK: - Interactor

protocol HomeUsecase {
    func fetchLibraries(pref: String)
    func fetchLibraries(pref: String, city: String)
    func fetchLibraries(systemid: String)
    func fetchLibraries(geocode: String)
}

protocol HomeInteractorDelegate: class {
    func didFetchLibraries(libraries: [Library])
    func didFailWithAPIError(apiError: APIError)
}

// MARK: - Presenter

protocol HomeViewPresentation {
    var libraries: [Library] { get }
    func viewDidLoad()
    func prefTextValueChanged(prefText: String)
    func didSelectRow(at indexPath: IndexPath)
}

// MARK: - Router

protocol HomeWireframe: class {
    func showLibraryDetail(_ library: Library)
}

// MARK: - View

protocol HomeView: class {
    func reloadData(libraries: [Library])
    func showAlert(message: String)
}
