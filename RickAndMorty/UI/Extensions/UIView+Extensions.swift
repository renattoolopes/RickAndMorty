//
//  UIView+Extensions.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit

// MARK: - Autolayout Extension
public extension UIView {
    
    enum AnchorViewType {
        case top
        case bottom
        case leading
        case trailing
    }
    
    /// This method set top, bottom, leading and trailing constraints of view for superview
    func fillContainer(_ view: UIView, withConstant: CGFloat = 0) {
        self.constraints.forEach { constraint in
            self.removeConstraint(constraint)
        }
        
        top(view, withConstant: withConstant)
        bottom(view, withConstant: withConstant)
        leading(view, withConstant: withConstant)
        trailing(view, withConstant: withConstant)

    }
    
    /// This method set top constraint of view for superview
    func top(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .top) {
        switch pinnedFor {
        case .top: return topAnchor.constraint(equalTo: view.topAnchor, constant: withConstant).isActive = true
        case .bottom: return topAnchor.constraint(equalTo: view.bottomAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned TOP")
        }
    }
    
    /// This method set bottom constraint of view for superview
    func bottom(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .bottom) {
        switch pinnedFor {
        case .top: return bottomAnchor.constraint(equalTo: view.topAnchor, constant: withConstant).isActive = true
        case .bottom: return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -withConstant).isActive = true
        default:
            print("Failed pinned BOTTOM")
        }
    }
    
    /// This method set leading constraint of view for superview
    func leading(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .leading) {
        switch pinnedFor {
        case .leading: return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: withConstant).isActive = true
        case .trailing: return leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: withConstant).isActive = true
        default:
            print("Failed pinned LEADING")
        }
    }
    
    /// This method set trailing constraint of view for superview
    func trailing(_ view: UIView, withConstant: CGFloat = 0, pinnedFor: AnchorViewType = .trailing) {
        
        switch pinnedFor {
        case .leading: return trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: withConstant).isActive = true
        case .trailing: return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -withConstant).isActive = true
        default:
            print("Failed pinned TRAILING")
        }
    }
}
