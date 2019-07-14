//
//  LibraryAPIResponse.swift
//  SwiftVIPERPracticeDataStore
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import UIKit

public struct LibraryAPIResponse: Decodable {
    public var libraries: [Library] = []
    
    public init(from decoder: Decoder) throws {
        var libraries: [Library] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let library = try unkeyedContainer.decode(Library.self)
            libraries.append(library)
        }
        self.init(libraries: libraries)
    }
    
    init(libraries: [Library]) {
        self.libraries = libraries
    }
}

public struct Library: Decodable {
    
    /// システムID
    public var systemid = ""
    /// システム名称
    public var systemname = ""
    /// システム毎の図書館キー
    public var libkey = ""
    /// 図書館のユニークID
    public var libid = ""
    /// 略称
    public var short = ""
    /// 正式名称
    public var formal = ""
    /// PC版ウェブサイト
    public var urlPc = ""
    /// 住所
    public var address = ""
    /// 都道府県
    public var pref = ""
    /// 市町村
    public var city = ""
    /// 郵便番号
    public var post = ""
    /// 電話番号
    public var tel = ""
    /// 位置情報
    public var geocode = ""
    /// カテゴリー
    public var category = ""
    /// 外観写真（現時点では空です）
    public var image: String?
    /// パラメータでgeocodeが指定されている場合、その地点からの距離(単位：km)
    public var distance: Double?
}

public struct LibraryAPIErrorResponse: Decodable {}
