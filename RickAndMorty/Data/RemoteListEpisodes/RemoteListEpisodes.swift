//
//  RemoteListEpisodes.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation
import Domain

public final class RemoteListEpisodes: ListEpisodes {
    // MARK: - Private Properties
    private let httpGetClient: HttpGetClient
    private let episodesURL: URL
    
    // MARK: - Inits
    public init(httpGetClient: HttpGetClient, url: URL) {
        self.httpGetClient = httpGetClient
        self.episodesURL = url
    }
    
    // MARK: - Public Methods
    public func listAll(withCompletion completion: @escaping ListEpisodesResult) {
        httpGetClient.get(url: episodesURL) { result in
            
            switch result {
                case .success(let data):
                    guard let episodes: [Episode] = try? makeEpisodes(withResponse: data) else {
                        return
                            completion(.failure(DomainError.failureConvertionToModel))
                    }
                    completion(.success(episodes))
                case .failure(let error):
                    completion(.failure(error))
                    break
            }
        }
    }
}

