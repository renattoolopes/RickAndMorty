//
//  Episode.swift
//  Data
//
//  Created by Renato Lopes on 14/12/20.
//

import Domain

public struct AllEpisodesResponse: Model {
    // MARK: - Public Properties
    public let info: InfoPageResponse
    public let results: [EpisodeResponse]
}

public struct InfoPageResponse: Model {
    // MARK: - Public Properties
    public let count: Int
    public let pages: Int
    public let next: String
    public let prev: String?
}

public struct EpisodeResponse: Model {
    // MARK: - Public Properties
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
