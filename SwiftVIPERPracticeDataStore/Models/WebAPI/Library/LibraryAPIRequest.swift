//
//  LibraryAPIRequest.swift
//  SwiftVIPERPracticeDataStore
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Foundation

public final class LibraryAPIRequest: APIRequest {
    
    public typealias Response = LibraryAPIResponse
    public typealias ErrorResponse = LibraryAPIErrorResponse
    public var path: String = "library"
    public var parameters: [String: Any]
    
    #warning("APIキーを発行して、セットする https://calil.jp/api/dashboard/")
    private static let appkey = ""
    private static let format = "json"
    private static let callback = ""
    private static let limit = 50
    
    /// 都道府県を指定して初期化
    public init(pref: String) {
        self.parameters = LibraryAPIRequest.createBaseParameters()
        self.parameters["pref"] = pref
    }
    /// 都道府県、市区町村を指定して初期化
    public init(pref: String, city: String) {
        self.parameters = LibraryAPIRequest.createBaseParameters()
        self.parameters["pref"] = pref
        self.parameters["city"] = city
    }
    /// 図書館のシステムIDを指定して初期化
    public init(systemid: String) {
        self.parameters = LibraryAPIRequest.createBaseParameters()
        self.parameters["systemid"] = systemid
    }
    /// 緯度、経度を指定して初期化
    ///
    /// 例「136.7163027,35.390516」
    public init(geocode: String) {
        self.parameters = LibraryAPIRequest.createBaseParameters()
        self.parameters["geocode"] = geocode
    }
}

extension LibraryAPIRequest {
    
    private static func createBaseParameters() -> [String: Any] {
        let parameters: [String: Any] = [
            "appkey": appkey,
            "format": format,
            "callback": callback,
            "limit": limit
        ]
        return parameters
    }
}
