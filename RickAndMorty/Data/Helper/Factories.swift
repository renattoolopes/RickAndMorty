//
//  Factories.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Domain
import Foundation

// MARK: - Public Methods
public func makeEpisodes(withResponse data: Data?) throws -> [Episode] {
    guard let episodesReponse: AllEpisodesResponse = data?.convertToModel() else {
        throw DomainError.failureConvertionToModel
    }
    
    let items: [Episode] = episodesReponse.results.map { (response) -> Episode in
        return Episode(name: response.name, airDate: response.airDate.date(), sessionEpisodeCode: response.episode)
    }
    
    return items
}
