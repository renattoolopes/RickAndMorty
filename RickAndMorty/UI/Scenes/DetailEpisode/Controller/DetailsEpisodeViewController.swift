//
//  DetailsEpisodeViewController.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit
import Presentation

public class DetailsEpisodeViewController: UIViewController {
    private var detailEpisodeView: DetailsEpisodeView?
    public var viewModel: DetailEpisodeViewModel?
    
    public override func loadView() {
        detailEpisodeView = DetailsEpisodeView()
        view = detailEpisodeView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailViewModel = viewModel else { return }
        detailEpisodeView?.setup(detailViewModel)
    }
}