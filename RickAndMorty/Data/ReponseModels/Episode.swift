//
//  Episode.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Domain

// MARK: - Episode
public struct EpisodeReponse: Model {
    public let id: Int
    public let name, airDate, episode: String
    public let characters: [String]
    public let url: String
    public let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
