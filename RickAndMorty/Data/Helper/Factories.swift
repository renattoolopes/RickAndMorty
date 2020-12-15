//
//  Factories.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Domain
import Foundation

public func makeEpisodes(withResponse data: Data?) throws -> [Episode] {
    guard let episodesReponse: [EpisodeResponse] = data?.convertToModel() else {
        throw DomainError.failureConvertionToModel
    }
    
    let items: [Episode] = episodesReponse.map { (response) -> Episode in
        return Episode(name: response.name, airDate: response.airDate.date(), sessionEpisodeCode: response.episode)
    }
    
    return items
}
