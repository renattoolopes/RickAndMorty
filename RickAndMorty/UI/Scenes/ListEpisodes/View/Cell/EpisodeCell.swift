//
//  EpisodeCell.swift
//  UI
//
//  Created by Renato Lopes on 14/12/20.
//

import UIKit

class EpisodeCell: UITableViewCell {
    // MARK: - Private Properties
    private let iconImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private let sessionEpisodeLabel: UILabel = UILabel()
    private let airDateLabel: UILabel = UILabel()
    
    // MARK: - Public Properties
    public static let identifier: String = EpisodeCell.description()
    
    // MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func prepareForReuse() {
        nameLabel.text = nil
        airDateLabel.text = nil
        sessionEpisodeLabel.text = nil
        iconImageView.image = nil
    }
    
    // MARK: - Public Methods
    public func setup(_ viewModel: EpisodeCellViewModel) {
        nameLabel.text = viewModel.name
        airDateLabel.text = viewModel.airDate
        sessionEpisodeLabel.text = viewModel.sessionEpisodeCode
    }
    
    // MARK: - Private Methods
    private func setupStyle() {
        // Fonts
        let titleFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        let subTitleFont: UIFont = UIFont.systemFont(ofSize: 8, weight: .regular)
        
        nameLabel.font = titleFont
        airDateLabel.font = subTitleFont
        sessionEpisodeLabel.font = subTitleFont
        
        // Colors
        let textColor: UIColor = UIColor.white
        nameLabel.textColor = textColor
        airDateLabel.textColor = textColor
        sessionEpisodeLabel.textColor = textColor
        
        // Image
        // TODO: Implement imageView with episode image
    }
}
