//
//  EpisodeCellViewModel.swift
//  UI
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public struct EpisodeCellViewModel {
    // MARK: - Public Properties
    public let name: String
    public let sessionEpisodeCode: String
    public var airDate: String
    
    // MARK: - Inits
    public init(name: String, airDate: String, sessionEpisodeCode: String) {
        self.name = name
        self.airDate = airDate
        self.sessionEpisodeCode = sessionEpisodeCode
    }
}
