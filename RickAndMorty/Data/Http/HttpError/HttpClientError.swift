//
//  HttpClientError.swift
//  Data
//
//  Created by Renato Lopes on 30/11/20.
//

import Foundation

public enum HttpClientError: Error, LocalizedError {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
    
    // MARK: - Public Properties
    public var errorDescription: String? {
        switch self {
        case .noConnectivity: return "Verifique a conexão com a internet."
        case .badRequest: return "Houve um problema ao buscar as informação."
        case .serverError: return "Houve um problema na comunicação com o servidor."
        case .unauthorized: return "Operação não permitida. Verifique as autorizações necessarias para realizar a solicitação."
        case .forbidden: return "Operação não permitida."
        }
    }
}
