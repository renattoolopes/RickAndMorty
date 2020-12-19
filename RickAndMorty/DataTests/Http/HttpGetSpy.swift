//
//  HttpGetSpy.swift
//  DataTests
//
//  Created by Renato Lopes on 18/12/20.
//

import Foundation
import Data

class HttpGetSpy: HttpGetClient {
    var url: URL?
    var completion: HttpGetClientResponse?
    
    func get(url: URL, _ completion: @escaping HttpGetClientResponse) {
        self.url = url
        self.completion = completion
    }
    
    func completionWithSuccess(_ data: Data? = nil) {
        completion?(.success(data))
    }
    
    func completionWithError(error: HttpClientError = .noConnectivity) {
        completion?(.failure(error))
    }
}
