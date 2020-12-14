//
//  ListEpisodes.swift
//  Domain
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation

public protocol ListEpisodes {
    // MARK: - Types
    typealias ListEpisodesResult = (Result<[Episode],Error>) -> Void
    
    // MARK: - Methods
    func listAll(withCompletion completion: @escaping ListEpisodesResult)
}
