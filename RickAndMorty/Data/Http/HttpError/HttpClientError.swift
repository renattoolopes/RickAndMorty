//
//  HttpClientError.swift
//  Data
//
//  Created by Renato Lopes on 30/11/20.
//

import Foundation

public enum HttpClientError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
