//
//  HomeInteractor.swift
//  SwiftVIPERPractice
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation
import SwiftVIPERPracticeDataStore

final class HomeInteractor: NSObject {
    weak var output: HomeInteractorDelegate?
}

extension HomeInteractor: HomeUsecase {
    
    func fetchLibraries(pref: String) {
        let request = LibraryAPIRequest(pref: pref)
        fetch(request: request)
    }
    
    func fetchLibraries(pref: String, city: String) {
        let request = LibraryAPIRequest(pref: pref, city: city)
        fetch(request: request)
    }
    
    func fetchLibraries(systemid: String) {
        let request = LibraryAPIRequest(systemid: systemid)
        fetch(request: request)
    }
    
    func fetchLibraries(geocode: String) {
        let request = LibraryAPIRequest(geocode: geocode)
        fetch(request: request)
    }
    
    private func fetch(request: LibraryAPIRequest) {
        APIClient.request(request: request)
            .done { response in
                guard let library = response as? LibraryAPIResponse else {
                    assertionFailure("LibraryAPIResponse decoding failure")
                    return
                }
                self.output?.didFetchLibraries(libraries: library.libraries)
            }
            .catch { error in
                guard let apiError = error as? APIError else {
                    assertionFailure("error is not APIError")
                    return
                }
                print(apiError.message)
                self.output?.didFailWithAPIError(apiError: apiError)
        }
    }
}
