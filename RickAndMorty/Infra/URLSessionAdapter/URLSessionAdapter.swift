//
//  URLSessionAdapter.swift
//  Infra
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation
import Data

public final class URLSessionAdapter: HttpGetClient {
    // MARK: - Private Properties
    private let configuration: URLSessionConfiguration
    
    // MARK: - Inits
    public init(configuration: URLSessionConfiguration = .default) {
        self.configuration = configuration
    }
    
    // MARK: - Public Methods
    public func get(url: URL, _ completion: @escaping HttpGetClientResponse) {
        let session: URLSession = URLSession(configuration: configuration)
        
        session.dataTask(with: url) { (data, response, error) in
            if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 204:
                    completion(.success(nil))
                case 200...299:
                    completion(.success(data))
                case 401:
                    completion(.failure(.unauthorized))
                case 403:
                    completion(.failure(.forbidden))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
            }
        }.resume()
    }
}
