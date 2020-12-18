//
//  AlertView.swift
//  Presentation
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public protocol AlertViewProtocol {
    // MARK: - Public Methods
    func show(_ viewModel: AlertViewModel)
}

public struct AlertViewModel {
    // MARK: - Public Properties
    public let title: String
    public let message: String
    
    // MARK: - Inits
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
