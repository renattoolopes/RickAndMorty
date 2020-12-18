//
//  DetailsEpisodeViewController.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit
import Presentation

public class DetailsEpisodeViewController: UIViewController {
    // MARK: - Public Properties
    public var viewModel: DetailEpisodeViewModel?
    // MARK: - Private Properties
    private var detailEpisodeView: DetailsEpisodeView?
    
    // MARK: - Life cyle
    public override func loadView() {
        detailEpisodeView = DetailsEpisodeView()
        view = detailEpisodeView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        guard let detailViewModel = viewModel else { return }
        title = "Detalhes"
        detailEpisodeView?.setup(detailViewModel)
    }
}

