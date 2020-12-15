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
        listEpisodes.listAll { result in
            switch result {
            case .success(let episodes):
                break
            case .failure(let error):
                self.alert.show(AlertViewModel(title: "Ocorreu um erro!", message: error.localizedDescription))
            }
        }
    }
}

public struct LoadingViewModel {
    // MARK: - Public Properties
    public let isLoading: Bool
    
    // MARK: - Inits
    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }
}


public protocol AlertViewProtocol {
    func show(_ viewModel: AlertViewModel)
}

public protocol LoadingViewProtocol {
    func display(_ viewModel: LoadingViewModel)
}

public struct AlertViewModel {
    // MARK: - Public Properties
    public let title: String
    public let message: String
    
    // MARK: - Inits
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
