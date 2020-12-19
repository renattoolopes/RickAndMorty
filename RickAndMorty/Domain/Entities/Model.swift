//
//  Model.swift
//  Domain
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public protocol Model: Codable, Equatable { }

public extension Model {
    func convertToData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
