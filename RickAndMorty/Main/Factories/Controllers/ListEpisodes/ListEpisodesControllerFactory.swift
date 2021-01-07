//
//  ListEpisodesControllerFactory.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain
import Presentation
import UI

public final class ListEpisodesControllerFactory {

    public static func instance(with useCase: ListEpisodes) -> ListEpisodesViewController {
        let controller: ListEpisodesViewController = ListEpisodesViewController()
                
        let presenter: ListEpisodesPresenter = ListEpisodesPresenter(listEpisodesUseCase: useCase,
                                                                     loadingView: WeakProxy(controller),
                                                                     alertView: WeakProxy(controller),
                                                                     delegate: WeakProxy(controller))
        controller.title = "Episodios"
        controller.listAllEpisodes = presenter.findAllEpisodes
        return controller
    }
}

final class WeakProxy<T: AnyObject> {
    private weak var weakInstance: T?
    
    init(_ strongInstance: T?) {
        self.weakInstance = strongInstance
    }
}


extension WeakProxy: AlertViewProtocol where T: AlertViewProtocol {
    func show(_ viewModel: AlertViewModel) {
        weakInstance?.show(viewModel)
    }
}

extension WeakProxy: LoadingViewProtocol where T: LoadingViewProtocol {
    func display(_ viewModel: LoadingViewModel) {
        weakInstance?.display(viewModel)
    }
}

extension WeakProxy: ListEpisodesReactivity where T: ListEpisodesReactivity {
    func didCompletedFindAll(episodes: [EpisodeViewModel]) {
        weakInstance?.didCompletedFindAll(episodes: episodes)
    }

}
