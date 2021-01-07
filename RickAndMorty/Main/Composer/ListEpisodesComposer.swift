//
//  ListEpisodesComposer.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Domain
import UI

final class ListEpisodesComposer {
    static func instance() -> ListEpisodesViewController {
        let useCase: ListEpisodes = RemoteListEpisodesFactory.instance()!
        return ListEpisodesControllerFactory.instance(with: useCase)
    }
}
