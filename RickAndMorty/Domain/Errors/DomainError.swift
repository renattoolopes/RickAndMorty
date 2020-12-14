//
//  ModelError.swift
//  Domain
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public enum DomainError: Error, LocalizedError {
    case failureConvertionToModel
    case falureConvertionToData
    
    public var errorDescription: String? {
        switch self {
            case .failureConvertionToModel: return "Falha ao obter as informações"
            case .falureConvertionToData: return "Falha ao obter as informações"
        }
    }
}
