//
//  Date+Extension.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public extension Date {
    // MARK: - Public Methods
    func toString(withFormat format: String = "d MMMM, yyyy") -> String? {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
