//
//  ListEpisodesPresenter.swift
//  Presentation
//
//  Created by Renato Lopes on 14/12/20.
//

import Foundation
import Domain
import Data

public protocol ListEpisodesReactivity {
    func didCompletedFindAll(episodes: [EpisodeViewModel])
}

public final class ListEpisodesPresenter {
    // MARK: - Private Properties
    private let listEpisodes: ListEpisodes
    private let loading: LoadingViewProtocol
    private let alert: AlertViewProtocol
    private let reactivity: ListEpisodesReactivity
    
    // MARK: - Inits
    public init(listEpisodesUseCase: ListEpisodes,
                loadingView: LoadingViewProtocol,
                alertView: AlertViewProtocol,
                delegate: ListEpisodesReactivity) {
        
        self.listEpisodes = listEpisodesUseCase
        self.loading = loadingView
        self.alert = alertView
        self.reactivity = delegate
    }
    
    // MARK: - Public Methods
    public func findAllEpisodes() {
        loading.display(LoadingViewModel(isLoading: true))
        listEpisodes.listAll { [weak self] result in
            guard let self: ListEpisodesPresenter = self else { return }
            switch result {
            case .success(let episodes):
                self.loading.display(LoadingViewModel(isLoading: true))
                self.reactivity.didCompletedFindAll(episodes: self.makeEpisodesViewModel(episodes))
            case .failure(let error):
                self.loading.display(LoadingViewModel(isLoading: true))
                self.alert.show(AlertViewModel(title: "Ocorreu um erro!", message: error.localizedDescription))
            }
        }
    }
    
    // MARK: - Private Methods
    private func makeEpisodesViewModel(_ response: [Episode]) -> [EpisodeViewModel] {
        let viewModels: [EpisodeViewModel] = response.map { episode -> EpisodeViewModel in
            return EpisodeViewModel(name: episode.name,
                                    airDate: episode.airDate,
                                    sessionEpisodeCode: episode.sessionEpisodeCode)
        }
        
        return viewModels
    }
}
