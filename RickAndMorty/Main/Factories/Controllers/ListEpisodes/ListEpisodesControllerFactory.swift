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
                                                                     loadingView: controller,
                                                                     alertView: controller, delegate: controller)
        controller.title = "Episodios"
        controller.listAllEpisodes = presenter.findAllEpisodes
        return controller
    }
}
