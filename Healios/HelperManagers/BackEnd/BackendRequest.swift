//
//  BackendRequest.swift
//  Fedon
//
//  Created by Zohrab Keshishyan on 3/5/21.
//

import Foundation
import Alamofire

/// Helper manager connected with serever, write recive data
class BackendRequest {
    
    /// Shared singleton instance used by all `AF.request` APIs. Cannot be modified.
    static var shared = BackendRequest()
    
    /// Server base path
    let base_url = "http://jsonplaceholder.typicode.com"
    
    //MARK: -`AF requests`
    
    /// - Passing Parameters:
    ///   - method:          `HTTPMethod` for the `URLRequest`. `requraes'.
    ///   - parameters:`Parameters` (a.k.a. `[String: Any]`).`nil` by default.
    ///   - headers:         `HTTPHeaders` value to be added to the `URLRequest`.  `nil` by default.
    ///
    /// - Returns:       Any `.
    func requestWith(url: URL, method: HTTPMethod, params: Parameters? = nil, headers: HTTPHeaders? = nil, complatation: @escaping (Any) -> ()) {
        
        AF.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<600)
            .responseJSON { response in
                print(response)
                switch (response.result) {
                
                case .success( _):
                    complatation(response.value)
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                    complatation(error)
                }
            }
    }
 
}

