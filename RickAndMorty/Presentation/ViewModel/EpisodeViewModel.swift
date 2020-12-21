//
//  EpisodeViewModel.swift
//  Presentation
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation
import Data

public struct EpisodeViewModel: Equatable {
    // MARK: - Public Properties
    public let name: String
    public let sessionEpisodeCode: String
    public var airDateText: String {
        airDate?.toString() ?? "Unknown"
    }
    
    // MARK: - Private Properties
    private let airDate: Date?
    
    // MARK: - Inits
    public init(name: String, airDate: Date? = nil, sessionEpisodeCode: String) {
        self.name = name
        self.airDate = airDate
        self.sessionEpisodeCode = sessionEpisodeCode
    }
}
