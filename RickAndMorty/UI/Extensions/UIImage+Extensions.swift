//
//  UIImage+Extensions.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit

public extension UIImage {
    static func image(_ name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle(for: ListEpisodesView.self), with: nil)
    }
}
