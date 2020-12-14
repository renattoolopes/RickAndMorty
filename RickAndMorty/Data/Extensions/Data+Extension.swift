//
//  Data+Extension.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public extension Data {
    func convertToModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
