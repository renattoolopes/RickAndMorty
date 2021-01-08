//
//  DispatchQueueMainDecorator.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain

public final class DispatchQueueMainDecorator<T> {
    // MARK: - Private Properties
    private let instance: T
    
    // MARK: - Inits
    public init(instance: T) {
        self.instance = instance
    }
    
    // MARK: - Public Methods
    public func dispatch(_ execute: @escaping () -> Void) {
        guard !Thread.isMainThread else { return execute() }
        
        DispatchQueue.main.async {
            execute()
        }
    }
}

// MARK: - UseCase Layer
extension DispatchQueueMainDecorator: ListEpisodes where T: ListEpisodes {
    
    public func listAll(withCompletion completion: @escaping ListEpisodesResult) {
        self.instance.listAll { [weak self] result in
            self?.dispatch {
                completion(result)
            }
        }
    }
}
