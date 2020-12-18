//
//  CoordinatorFactoriesInjector.swift
//  UI
//
//  Created by Renato Lopes on 17/12/20.
//

import Foundation

public class CoordinatorFactoriesInjector {
    private var dependencies: [String: () -> AnyObject] = [ : ]
    public static var shared: CoordinatorFactoriesInjector = CoordinatorFactoriesInjector()
    
    public func register<T>(forType: T.Type, factory: @escaping () -> AnyObject) {
        let key: String = String(describing: T.self)
        dependencies[key] = factory
    }
    
    public func get<T>(forType: T.Type) -> T? {
        let key: String = String(describing: T.self)
        guard let factory: () -> AnyObject = dependencies[key] else { return nil }
        return factory() as? T
    }
    
    private init() { }
}
