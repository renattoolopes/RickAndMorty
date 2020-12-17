//
//  ListEpisodesViewController.swift
//  UI
//
//  Created by Renato Lopes on 15/12/20.
//

import UIKit
import Presentation

public final class ListEpisodesViewController: UIViewController {
    // MARK: - Private Properties
    private var listEpisodesView: ListEpisodesView?
    private let loadingView: LoadingViewAnimation = LoadingViewAnimation()

    private var episodes: [EpisodeViewModel] = []

    // MARK: - Events
    public var listAllEpisodes: () -> Void = {}
    
    // MARK: - Life Cycle
    public override func loadView() {
        listEpisodesView = ListEpisodesView()
        view = listEpisodesView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
        listAllEpisodes()
    }
    
    private func tableViewConfiguration() {        
        listEpisodesView?.registerCellInTableView(EpisodeCell.self,
                                                  withIdentifier: EpisodeCell.identifier)
        listEpisodesView?.tableViewDelegate(self)
        listEpisodesView?.tableViewDataSource(self)
    }
}

extension ListEpisodesViewController: UITableViewDelegate { }

extension ListEpisodesViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier,
                                                       for: indexPath) as? EpisodeCell
        else {
            return UITableViewCell()
        }
        guard episodes.count > 0, indexPath.row <= (episodes.count - 1) else { return UITableViewCell() }
        let episode: EpisodeViewModel = episodes[indexPath.row]
        
        let name: String = episode.name
        let airDate: String = episode.airDateText
        let sessionEpisodeCode: String = episode.sessionEpisodeCode
        
        let viewModel = EpisodeCellViewModel(name: name,
                                             airDate: airDate,
                                             sessionEpisodeCode: sessionEpisodeCode)
        cell.setup(viewModel)
        return cell
    }
}

extension ListEpisodesViewController: ListEpisodesReactivity {
    public func didCompletedFindAll(episodes: [EpisodeViewModel]) {
        self.episodes = episodes
        listEpisodesView?.reloadTableView()
    }
}

extension ListEpisodesViewController: LoadingViewProtocol {
    public func display(_ viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            DispatchQueue.main.async {
                self.loadingView.startLoading(inView: self.view)
            }
        } else {
            DispatchQueue.main.async {
                self.loadingView.stopLoading()
            }
        }
    }
}

extension ListEpisodesViewController: AlertViewProtocol {
    public func show(_ viewModel: AlertViewModel) {
        // Implement Alert
    }
}
