//
//  LoadingView.swift
//  Presentation
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public protocol LoadingViewProtocol {
    func display(_ viewModel: LoadingViewModel)
}

public struct LoadingViewModel {
    // MARK: - Public Properties
    public let isLoading: Bool
    
    // MARK: - Inits
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
