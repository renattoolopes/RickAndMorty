//
//  ListEpisodesSpy.swift
//  PresentationTests
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain
import Presentation

public class ListEpisodesSpy: ListEpisodes {
    public var completion: (ListEpisodesResult)?
    
    public func listAll(withCompletion completion: @escaping ListEpisodesResult) {
        self.completion = completion
    }
    
    public func complitionWithSuccess(_ episodes: [Episode]) {
        completion?(.success(episodes))
    }
    
    public func complitionWithError() {
        completion?(.failure(DomainError.falureConvertionToData))
    }
    
    public init() { }
}
