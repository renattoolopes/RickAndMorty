//
//  ListEpisodesCoordinator.swift
//  UI
//
//  Created by Renato Lopes on 17/12/20.
//

import UIKit
import Presentation

public final class ListEpisodesCoordinator: Coordinator {
    // MARK: - Public Properties
    public var childCoordinator: [Coordinator]
    // MARK: - Private Properties
    private var navigation: UINavigationController
    
    // MARK: - Inits
    public init(navigation: UINavigationController) {
        childCoordinator = [Coordinator]()
        self.navigation = navigation
    }
    
    // MARK: - Public Methods
    public func start() {
        let injector: CoordinatorFactoriesInjector = CoordinatorFactoriesInjector.shared
        
        guard let controller = injector.get(forType: ListEpisodesViewController.self) else { return }
        controller.openDetails = openDetails
        navigation.viewControllers = [controller]
    }
    
    public func openDetails(_ viewModel: DetailEpisodeViewModel) {
        let detailsCoordinator: DetailsEpisodeCoordinator = DetailsEpisodeCoordinator(navigation: navigation, viewModel: viewModel)
        childCoordinator.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}

public final class DetailsEpisodeCoordinator: Coordinator {
    // MARK: - Public Properties
    public var childCoordinator: [Coordinator]
    
    // MARK: - Private Properties
    private var navigation: UINavigationController
    private var viewModel: DetailEpisodeViewModel?
    
    // MARK: - Inits
    public init(navigation: UINavigationController, viewModel: DetailEpisodeViewModel? = nil) {
        self.childCoordinator = [Coordinator]()
        self.navigation = navigation
        self.viewModel = viewModel
    }
    
    // MARK: - Public Methods
    public func start() {
        let injector: CoordinatorFactoriesInjector = CoordinatorFactoriesInjector.shared
        
        guard let controller = injector.get(forType: DetailsEpisodeViewController.self) else { return }
        controller.viewModel = viewModel
        navigation.pushViewController(controller, animated: true)
    }
}


 public protocol Coordinator {
    // MARK: - Public Properties
    var childCoordinator: [Coordinator] { get set }
    
    // MARK: - Public Methods
    func start()
}
