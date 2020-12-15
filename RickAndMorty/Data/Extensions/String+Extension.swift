//
//  String+Extension.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public extension String {
    func date(withFormat format: String = "MMMM d, yyyy") -> Date? {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
