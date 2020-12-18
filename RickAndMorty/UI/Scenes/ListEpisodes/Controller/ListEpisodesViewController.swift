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
    public var openDetails: ((_ withViewModel: DetailEpisodeViewModel) -> Void)?
    
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
    
    // MARK: - Private Methods
    private func tableViewConfiguration() {        
        listEpisodesView?.registerCellInTableView(EpisodeCell.self,
                                                  withIdentifier: EpisodeCell.identifier)
        listEpisodesView?.tableViewDelegate(self)
        listEpisodesView?.tableViewDataSource(self)
    }
}

// MARK: - UITableViewDelegate
extension ListEpisodesViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard episodes.count > 0, indexPath.row <= (episodes.count - 1) else { return }
        let selectedViewModel = episodes[indexPath.row]
        
        let detailViewModel = DetailEpisodeViewModel(episodeName: selectedViewModel.name, airDate: selectedViewModel.airDateText, sessionEpisodeCode: selectedViewModel.sessionEpisodeCode)
        
        openDetails?(detailViewModel)
    }
}

// MARK: - UITableViewDataSource
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

        cell.setup(episode)
        return cell
    }
}

// MARK: - ListEpisodesReactivity
extension ListEpisodesViewController: ListEpisodesReactivity {
    public func didCompletedFindAll(episodes: [EpisodeViewModel]) {
        self.episodes = episodes
        listEpisodesView?.reloadTableView()
    }
}

// MARK: - LoadingViewProtocol
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

// MARK: - AlertViewProtocol
extension ListEpisodesViewController: AlertViewProtocol {
    public func show(_ viewModel: AlertViewModel) {
        let alertController: UIAlertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        let tryAgainAction: UIAlertAction = UIAlertAction(title: "Tentar novamente", style: .default) { _ in
            self.listAllEpisodes()
        }
        
        alertController.addAction(tryAgainAction)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
