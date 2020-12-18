//
//  CoordinatorFactoriesInjector.swift
//  UI
//
//  Created by Renato Lopes on 17/12/20.
//

import Foundation

public class CoordinatorFactoriesInjector {
    // MARK: - Public Properties
    public static var shared: CoordinatorFactoriesInjector = CoordinatorFactoriesInjector()
    // MARK: - Private Properties
    private var dependencies: [String: () -> AnyObject] = [ : ]
    
    // MARK: - Inits
    private init() { }
    
    // MARK: - Public Methods
    public func register<T>(forType: T.Type, factory: @escaping () -> AnyObject) {
        let key: String = String(describing: T.self)
        dependencies[key] = factory
    }
    
    public func get<T>(forType: T.Type) -> T? {
        let key: String = String(describing: T.self)
        guard let factory: () -> AnyObject = dependencies[key] else { return nil }
        return factory() as? T
    }
}
