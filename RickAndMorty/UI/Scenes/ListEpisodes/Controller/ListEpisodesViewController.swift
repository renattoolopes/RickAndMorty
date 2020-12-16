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
    }
}
