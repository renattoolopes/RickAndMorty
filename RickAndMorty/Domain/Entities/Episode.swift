//
//  Episode.swift
//  Domain
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public class Episode: Model {
    // MARK: - Public Properties
    public let name: String
    public let airDate: Date?
    public let sessionEpisodeCode: String
    
    // MARK: - Inits
    public init(name: String, airDate: Date? = nil, sessionEpisodeCode: String) {
        self.name = name
        self.airDate = airDate
        self.sessionEpisodeCode = sessionEpisodeCode
    }
}
