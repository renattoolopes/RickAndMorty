//
//  EpisodeCell.swift
//  UI
//
//  Created by Renato Lopes on 14/12/20.
//

import UIKit

public final class EpisodeCell: UITableViewCell {
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
        iconImageView.image = nil
    }
    
    // MARK: - Public Methods
    public func setup(_ viewModel: EpisodeCellViewModel) {
        nameLabel.text = viewModel.name
        airDateLabel.text = viewModel.airDate
        sessionEpisodeLabel.text = viewModel.sessionEpisodeCode
    }
    
    // MARK: - Private Methods
    private func setupSubviews() {
        [nameLabel, airDateLabel, sessionEpisodeLabel].forEach { view in
            addSubview(view)
        }
    }
    
    private func setupAutolayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        sessionEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.top(self)
        nameLabel.leading(self)
        nameLabel.trailing(self)
        
        airDateLabel.top(nameLabel, withConstant: 8, pinnedFor: .bottom)
        airDateLabel.leading(self)
        airDateLabel.trailing(self)
        
        sessionEpisodeLabel.top(airDateLabel, withConstant: 8, pinnedFor: .bottom)
        sessionEpisodeLabel.leading(self)
        sessionEpisodeLabel.trailing(self)
        sessionEpisodeLabel.bottom(self)
    }
    
    private func setupStyle() {
        // View
        backgroundColor = .lightGray
        
        // Fonts
        let titleFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        let subTitleFont: UIFont = UIFont.systemFont(ofSize: 8, weight: .regular)
        
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
        
        // Image
        // TODO: Implement imageView with episode image
    }
}

// MARK: - Autolayout Extension
extension UIView {
    
    enum AnchorViewType {
        case top
        case bottom
        case leading
        case trailing
    }
    
    func fillContainer(_ view: UIView, withConstant: CGFloat = 0) {
        self.constraints.forEach { constraint in
            self.removeConstraint(constraint)
        }
        
        top(view, withConstant: withConstant)
        bottom(view, withConstant: withConstant)
        leading(view, withConstant: withConstant)
        trailing(view, withConstant: withConstant)

    }
    
    func top(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .top) {
        switch pinnedFor {
        case .top: return topAnchor.constraint(equalTo: view.topAnchor, constant: withConstant).isActive = true
        case .bottom: return topAnchor.constraint(equalTo: view.bottomAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned view in TOP")
        }
    }
    
    func bottom(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .bottom) {
        switch pinnedFor {
        case .top: return bottomAnchor.constraint(equalTo: view.topAnchor, constant: withConstant).isActive = true
        case .bottom: return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned view in TOP")
        }
    }
    
    func leading(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .leading) {
        switch pinnedFor {
        case .leading: return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: withConstant).isActive = true
        case .trailing: return leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned view in TOP")
        }
    }
    
    func trailing(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .trailing) {
        
        switch pinnedFor {
        case .leading: return trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: withConstant).isActive = true
        case .trailing: return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned view in Trailing")
        }
    }
}



