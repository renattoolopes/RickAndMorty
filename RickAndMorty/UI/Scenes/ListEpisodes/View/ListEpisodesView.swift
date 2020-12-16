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
        setupStyle()
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func registerCellInTableView(_ cell: AnyClass ,withIdentifier: String) {
        tableView.register(cell.self , forCellReuseIdentifier: withIdentifier)
    }
    
    public func tableViewDataSource<T: UITableViewDataSource>(_ dataSource: T) {
        tableView.dataSource = dataSource
    }
    
    public func tableViewDelegate<T: UITableViewDelegate>(_ delegate: T) {
        tableView.delegate = delegate
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        addSubview(tableView)
    }
    
    private func setupStyle() {
        backgroundColor = .white
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        tableView.allowsMultipleSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    private func setupAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}


