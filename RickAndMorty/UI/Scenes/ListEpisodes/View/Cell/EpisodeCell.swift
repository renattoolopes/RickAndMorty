//
//  EpisodeCell.swift
//  UI
//
//  Created by Renato Lopes on 14/12/20.
//

import UIKit

public final class EpisodeCell: UITableViewCell {
    // MARK: - Private Properties
    private let container: UIView = UIView()
    private let nameLabel: UILabel = UILabel()
    private let sessionEpisodeLabel: UILabel = UILabel()
    private let airDateLabel: UILabel = UILabel()
    
    // MARK: - Public Properties
    public static let identifier: String = EpisodeCell.description()
    
    // MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupAutolayout()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    public override func prepareForReuse() {
        nameLabel.text = nil
        airDateLabel.text = nil
        sessionEpisodeLabel.text = nil
    }
    
    // MARK: - Public Methods
    public func setup(_ viewModel: EpisodeCellViewModel) {
        nameLabel.text = viewModel.name
        airDateLabel.text = viewModel.airDate
        sessionEpisodeLabel.text = viewModel.sessionEpisodeCode
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        contentView.addSubview(container)

        [nameLabel, airDateLabel, sessionEpisodeLabel].forEach { view in
            container.addSubview(view)
        }
    }
    
    private func setupAutolayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        sessionEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.fillContainer(contentView, withConstant: 8)
        
        nameLabel.top(container,withConstant: 8)
        nameLabel.leading(container, withConstant: 8)
        nameLabel.trailing(container, withConstant: 8)
        
        airDateLabel.top(nameLabel, withConstant: 8, pinnedFor: .bottom)
        airDateLabel.leading(container, withConstant: 8)
        airDateLabel.trailing(container, withConstant: 8)
        
        sessionEpisodeLabel.top(airDateLabel, withConstant: 8, pinnedFor: .bottom)
        sessionEpisodeLabel.leading(container, withConstant: 8)
        sessionEpisodeLabel.trailing(container, withConstant: 8)
        sessionEpisodeLabel.bottom(container, withConstant: 8)
    }
    
    private func setupStyle() {
        // View
        backgroundColor = .darkGray
        contentView.backgroundColor = .darkGray
        container.backgroundColor = .lightGray
        container.layer.cornerRadius = 8
        
        // Fonts
        let titleFont: UIFont = UIFont.systemFont(ofSize: 22, weight: .bold)
        let subTitleFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        nameLabel.font = titleFont
        nameLabel.numberOfLines = 0
        airDateLabel.font = subTitleFont
        airDateLabel.numberOfLines = 0
        sessionEpisodeLabel.font = subTitleFont
        sessionEpisodeLabel.numberOfLines = 0
        
        // Colors
        let textColor: UIColor = UIColor.white
        nameLabel.textColor = textColor
        airDateLabel.textColor = textColor
        sessionEpisodeLabel.textColor = textColor
    }
}
