//
//  LoadingSpy.swift
//  PresentationTests
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Presentation

public class LoadingSpy: LoadingViewProtocol {
    
    public var emit: ((LoadingViewModel) -> Void)?
    
    public func observer(completion: @escaping (LoadingViewModel) -> Void) {
        self.emit = completion
    }
    
    public func display(_ viewModel: LoadingViewModel) {
        self.emit?(viewModel)
    }
    
    public init() { }
}
