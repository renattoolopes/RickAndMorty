//
//  ListEpisodesViewController.swift
//  UI
//
//  Created by Renato Lopes on 15/12/20.
//

import UIKit

public final class ListEpisodesViewController: UIViewController {
    // MARK: - Private Properties
    private var listEpisodesView: ListEpisodesView?
    
    // MARK: - Life Cycle
    public override func loadView() {
        listEpisodesView = ListEpisodesView()
        view = listEpisodesView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
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
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier,
                                                       for: indexPath) as? EpisodeCell
        else {
            return UITableViewCell()
        }
        
        let viewModel = EpisodeCellViewModel(name: "Teste Title", airDate: "00 Dezembro", sessionEpisodeCode: "S00E00")
        cell.setup(viewModel)
        return cell
    }
}

