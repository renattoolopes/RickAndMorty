//
//  DetailEpisode.swift
//  Presentation
//
//  Created by Renato Lopes on 17/12/20.
//

import Foundation

public struct DetailEpisodeViewModel {
    // MARK: - Public Properties
    public var episodeTitle: String {
        return "O nome do episodio é:"
    }
    
    public var airDateTitle: String {
        return "O episodio foi lançado:"
    }
    
    public var sessionEpisodeCodeTitle: String {
        return "A temporada e numero do episodio, são:"
    }
    
    public var episodeName: String
    public var airDate: String
    public var sessionEpisodeCode: String
    
    // MARK: - Inits
    public init(episodeName: String, airDate: String, sessionEpisodeCode: String) {
        self.episodeName = episodeName
        self.airDate = airDate
        self.sessionEpisodeCode = sessionEpisodeCode
    }
}
