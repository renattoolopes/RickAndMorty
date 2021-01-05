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
        

        let controller: ListEpisodesViewController = ListEpisodesViewController()
        
        guard let url: URL = makeURL(path: "episode") else { return controller }
        
        let listEpisodes: RemoteListEpisodes = RemoteListEpisodes(httpGetClient: httpGetClient, url: url)
        
        let presenter: ListEpisodesPresenter = ListEpisodesPresenter(listEpisodesUseCase: listEpisodes, loadingView: controller, alertView: controller, delegate: controller)
        controller.title = "Episodios"
        controller.listAllEpisodes = presenter.findAllEpisodes
        return controller
    }
    
    private static func makeURL(path: String) -> URL? {
        guard let api: String = Environment.variable(Environment.EnvironmentVariables.apiBaseUrl) else { return nil }
        return URL(string: "\(api)/\(path)")
    }

}
