//
//  ListEpisodesReactivitySpy.swift
//  PresentationTests
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Presentation

public class ListEpisodesReactivitySpy: ListEpisodesReactivity {
    public var emit: (([EpisodeViewModel]) -> Void)?
    
    public func observer(completion: @escaping ([EpisodeViewModel]) -> Void) {
        self.emit = completion
    }
    
    public func didCompletedFindAll(episodes: [EpisodeViewModel]) {
        self.emit?(episodes)
    }
    
    public init() { }
}
