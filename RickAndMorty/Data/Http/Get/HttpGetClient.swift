//
//  HttpGetClient.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public protocol HttpGetClient {
    // MARK: - Types
    typealias HttpGetClientResponse = (Result<Data?, HttpClientError>) -> Void
    
    // MARK: - Methods
    func get(url: URL, _ completion: @escaping HttpGetClientResponse)
}
