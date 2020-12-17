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
        // use case
        // httpGet
        // loading view
        // alert view
        // reactivity delegate
        let httpGetClient: HttpGetClient = URLSessionAdapter()
        let url: URL = URL(string: "https://rickandmortyapi.com/api/episode")!
        let controller: ListEpisodesViewController = ListEpisodesViewController()

        let listEpisodes: RemoteListEpisodes = RemoteListEpisodes(httpGetClient: httpGetClient, url: url)
        
        let presenter: ListEpisodesPresenter = ListEpisodesPresenter(listEpisodesUseCase: listEpisodes, loadingView: controller, alertView: controller, delegate: controller)
        
        controller.listAllEpisodes = presenter.findAllEpisodes
        return controller
    }

}
