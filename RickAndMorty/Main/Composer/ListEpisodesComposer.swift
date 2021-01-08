//
//  ListEpisodesComposer.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain
import UI

public final class ListEpisodesComposer {
    public static func instance() -> ListEpisodesViewController {
        let useCase: ListEpisodes = ListEpisodesUseCaseFactory.instance()!
        return ListEpisodesControllerFactory.instance(with: useCase)
    }
}
