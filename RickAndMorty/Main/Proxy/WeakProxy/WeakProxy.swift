//
//  WeakProxy.swift
//  Main
//
//  Created by Renato Lopes on 07/01/21.
//

import Foundation
import Presentation

final class WeakProxy<T: AnyObject> {
    private weak var weakInstance: T?
    
    init(_ strongInstance: T?) {
        self.weakInstance = strongInstance
    }
}

//MARK: - WeakProxy Presentation Layer
extension WeakProxy: AlertViewProtocol where T: AlertViewProtocol {
    func show(_ viewModel: AlertViewModel) {
        weakInstance?.show(viewModel)
    }
}

extension WeakProxy: LoadingViewProtocol where T: LoadingViewProtocol {
    func display(_ viewModel: LoadingViewModel) {
        weakInstance?.display(viewModel)
    }
}

extension WeakProxy: ListEpisodesReactivity where T: ListEpisodesReactivity {
    func didCompletedFindAll(episodes: [EpisodeViewModel]) {
        weakInstance?.didCompletedFindAll(episodes: episodes)
    }

}
