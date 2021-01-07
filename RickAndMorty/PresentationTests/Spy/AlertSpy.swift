//
//  AlertSpy.swift
//  PresentationTests
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Presentation

public class AlertSpy: AlertViewProtocol {
    public var emit: ((AlertViewModel) -> Void)?
    
    public func observer(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }
    
    public func show(_ viewModel: AlertViewModel) {
        emit?(viewModel)
    }
    
    public init() { }
}
