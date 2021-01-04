//
//  ListEpisodesFactory.swift
//  Main
//
//  Created by Renato Lopes on 16/12/20.
//

import Foundation
import Domain
import Data
import Infra
import Presentation
import UI

final class ListEpisodesFactory {

    public static func instance() -> ListEpisodesViewController {
        let httpGetClient: HttpGetClient = URLSessionAdapter()
        let url: URL = URL(string: "")!
        let controller: ListEpisodesViewController = ListEpisodesViewController()

        let listEpisodes: RemoteListEpisodes = RemoteListEpisodes(httpGetClient: httpGetClient, url: url)
        
        let presenter: ListEpisodesPresenter = ListEpisodesPresenter(listEpisodesUseCase: listEpisodes, loadingView: controller, alertView: controller, delegate: controller)
        controller.title = "Episodios"
        controller.listAllEpisodes = presenter.findAllEpisodes
        return controller
    }

}
