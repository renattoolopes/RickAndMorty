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
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        addSubview(tableView)
    }
    
    private func setupStyle() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        tableView.allowsMultipleSelection = false
    }
}


