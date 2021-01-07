//
//  RemoteListEpisodesFactory.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain
import Data
import Infra


final class RemoteListEpisodesFactory {

    public static func instance() -> RemoteListEpisodes? {
        let httpGetClient: HttpGetClient = URLSessionAdapter()
        guard let url: URL = makeURL(path: "episode") else { return nil }        
        return RemoteListEpisodes(httpGetClient: httpGetClient, url: url)
    }
    
    private static func makeURL(path: String) -> URL? {
        guard let api: String = Environment.variable(Environment.EnvironmentVariables.apiBaseUrl) else { return nil }
        return URL(string: "\(api)/\(path)")
    }

}
