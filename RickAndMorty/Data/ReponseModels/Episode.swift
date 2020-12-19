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
    
    public init(info: InfoPageResponse, results: [EpisodeResponse]) {
        self.info = info
        self.results = results
    }
}

public struct InfoPageResponse: Model {
    // MARK: - Public Properties
    public let count: Int
    public let pages: Int
    public let next: String
    public let prev: String?
    
    public init(count: Int,
                pages: Int,
                next: String,
                prev: String? = nil) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

public struct EpisodeResponse: Model {
    // MARK: - Public Properties
    public let id: Int
    public let name, airDate, episode: String
    public let characters: [String]
    public let url: String
    public let created: String

    public init(id: Int,
                name: String,
                airDate: String,
                episode: String,
                characters: [String],
                url: String,
                created: String) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
