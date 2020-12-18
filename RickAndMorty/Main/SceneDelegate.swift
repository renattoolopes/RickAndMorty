//
//  SceneDelegate.swift
//  Main
//
//  Created by Renato Lopes on 15/12/20.
//

import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: ListEpisodesCoordinator?
    
    private func addFactoriesForCoordinators() {
        let injector: CoordinatorFactoriesInjector = CoordinatorFactoriesInjector.shared
        injector.register(forType: ListEpisodesViewController.self,
                                    factory: ListEpisodesFactory.instance)
        
        injector.register(forType: DetailsEpisodeViewController.self,
                                    factory: DetailsEpisodeFactory.instance)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene: UIWindowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        let naviagation: UINavigationController = UINavigationController()
        window?.rootViewController = naviagation
        window?.makeKeyAndVisible()
        
        addFactoriesForCoordinators()
        mainCoordinator = ListEpisodesCoordinator(navigation: naviagation)
        mainCoordinator?.start()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

