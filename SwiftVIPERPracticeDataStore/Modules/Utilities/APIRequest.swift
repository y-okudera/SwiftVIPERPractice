//
//  APIRequest.swift
//  SwiftVIPERPracticeDataStore
//
//  Created by Yuki Okudera on 2019/07/13.
//  Copyright © 2019 Yuki Okudera. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - Protocol
public protocol APIRequest {
    
    associatedtype Response: Decodable
    associatedtype ErrorResponse: Decodable
    
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var httpHeaderFields: [String: String] { get }
    
    func decode(data: Data) -> Response?
    func decode(errorResponseData: Data) -> ErrorResponse?
    
    /// URLRequestを生成する
    func makeURLRequest(needURLEncoding: Bool) -> URLRequest?
}

// MARK: - Default implementation
extension APIRequest {
    
    public var baseURL: URL {
        guard let url = URL(string: "https://api.calil.jp/") else {
            fatalError("baseURL is nil.")
        }
        return url
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/path"
    }
    
    public var parameters: [String: String] {
        return [:]
    }
    
    public var httpHeaderFields: [String: String] {
        return [:]
    }
    
    public func decode(data: Data) -> Response? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode(Response.self, from: data)
        } catch {
            print("Response decode error:\(error)")
            return nil
        }
    }
    
    public func decode(errorResponseData: Data) -> ErrorResponse? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode(ErrorResponse.self, from: errorResponseData)
        } catch {
            print("ErrorResponse decode error:\(error)")
            return nil
        }
    }
    
    public func makeURLRequest(needURLEncoding: Bool = false) -> URLRequest? {
        
        let endPoint = baseURL.absoluteString + path
        
        // String to URL
        guard let url = URL(string: endPoint) else {
            assertionFailure("エンドポイントが不正\nendPoint:\(endPoint)")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaderFields
        urlRequest.timeoutInterval = 30
        
        if !needURLEncoding {
            return urlRequest
        }
        
        // パラメータをエンコードする
        do {
            urlRequest = try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        } catch {
            assertionFailure("エンコーディング処理でエラー発生\nURLRequest:\(urlRequest)")
            return nil
        }
    }
}

