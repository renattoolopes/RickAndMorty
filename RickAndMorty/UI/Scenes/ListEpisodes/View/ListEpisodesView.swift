//
//  ListEpisodesView.swift
//  UI
//
//  Created by Renato Lopes on 14/12/20.
//

import UIKit

class ListEpisodesView: UIView {
    // MARK: - Private Properties
    private let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


