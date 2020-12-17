//
//  DetailsEpisodeView.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit
import Presentation

class DetailsEpisodeView: UIView {
    // MARK: - Private Properties
    private let episodeTitleLabel: UILabel = UILabel()
    private let episodeNameLabel: UILabel = UILabel()
    private let airDateTitleLabel: UILabel = UILabel()
    private let airDateLabel: UILabel = UILabel()
    private let sessionEpisodeCodeTitleLabel: UILabel = UILabel()
    private let sessionEpisodeCodeLabel: UILabel = UILabel()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupAutolayout()
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func setup(_ viewModel: DetailEpisodeViewModel) {
        episodeTitleLabel.text = viewModel.episodeTitle
        airDateTitleLabel.text = viewModel.airDateTitle
        sessionEpisodeCodeTitleLabel.text = viewModel.sessionEpisodeCodeTitle
        
        episodeNameLabel.text = viewModel.episodeName
        airDateLabel.text = viewModel.airDate
        sessionEpisodeCodeLabel.text = viewModel.sessionEpisodeCode
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        [episodeTitleLabel,
         episodeNameLabel,
         airDateTitleLabel,
         airDateLabel,
         sessionEpisodeCodeTitleLabel,
         sessionEpisodeCodeLabel].forEach { view in
            addSubview(view)
         }
    }
    
    private func setupAutolayout() {
        [episodeTitleLabel,
         episodeNameLabel,
         airDateTitleLabel,
         airDateLabel,
         sessionEpisodeCodeTitleLabel,
         sessionEpisodeCodeLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
         }
        
        episodeTitleLabel.top(self)
        episodeTitleLabel.leading(self)
        episodeTitleLabel.trailing(self)
        
        episodeNameLabel.top(episodeTitleLabel, withConstant: 8, pinnedFor: .bottom)
        episodeNameLabel.leading(self)
        episodeNameLabel.trailing(self)
        
        airDateTitleLabel.top(episodeNameLabel, withConstant: 8, pinnedFor: .bottom)
        airDateTitleLabel.leading(self)
        airDateTitleLabel.trailing(self)
        
        airDateLabel.top(airDateTitleLabel, withConstant: 8, pinnedFor: .bottom)
        airDateLabel.leading(self)
        airDateLabel.trailing(self)
        
        sessionEpisodeCodeTitleLabel.top(airDateLabel, withConstant: 8, pinnedFor: .bottom)
        sessionEpisodeCodeTitleLabel.leading(self)
        sessionEpisodeCodeTitleLabel.trailing(self)
        
        sessionEpisodeCodeLabel.top(sessionEpisodeCodeTitleLabel, withConstant: 8, pinnedFor: .bottom)
        sessionEpisodeCodeLabel.leading(self)
        sessionEpisodeCodeLabel.trailing(self)
        sessionEpisodeCodeLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupStyle() {
        // View
        backgroundColor = .darkGray
        // Fonts
        let titleFont: UIFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        let contentFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        episodeTitleLabel.font = titleFont
        airDateTitleLabel.font = titleFont
        sessionEpisodeCodeTitleLabel.font = titleFont
        
        episodeNameLabel.font = contentFont
        airDateLabel.font = contentFont
        sessionEpisodeCodeLabel.font = contentFont
        
        // Colors
        let textColor: UIColor = .white
        
        episodeTitleLabel.textColor = textColor
        airDateTitleLabel.textColor = textColor
        sessionEpisodeCodeTitleLabel.textColor = textColor
        
        episodeNameLabel.textColor = textColor
        airDateLabel.textColor = textColor
        sessionEpisodeCodeLabel.textColor = textColor
        
        [episodeTitleLabel,
         episodeNameLabel,
         airDateTitleLabel,
         airDateLabel,
         sessionEpisodeCodeTitleLabel,
         sessionEpisodeCodeLabel].forEach { label in
            label.numberOfLines = 0
         }
    }
}
