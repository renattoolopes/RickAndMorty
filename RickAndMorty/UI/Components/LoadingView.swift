//
//  LoadingView.swift
//  UI
//
//  Created by Renato Lopes on 16/12/20.
//

import UIKit

public class LoadingViewAnimation {
    // MARK: - Private Properties
    private var backgroundView: UIView?
    
    // MARK: - Inits
    init() { /* no-op */}
    
    // MARK: - Public Methods
    
    /// Method show loading view
    ///     - Parameters:
    ///         - inView: view where the loading should appear
    public func startLoading(inView view: UIView) {
        self.stopLoading()
        let backgroundAlpha: CGFloat = 0.5
        let backgroundViewColor: UIColor = UIColor.black.withAlphaComponent(backgroundAlpha)
        
        backgroundView = UIView()
        guard let backgroundView = self.backgroundView else { return }
        backgroundView.frame = view.frame
        backgroundView.backgroundColor = backgroundViewColor
        
        let image: UIImageView = UIImageView(image: UIImage.image("placeholder"))
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.fillContainer(view)
        
        backgroundView.addSubview(image)
        image.fillContainer(backgroundView, withConstant: 100)
        image.contentMode = .scaleAspectFit

        rotateAnimation(forView: image)
        image.startAnimating()
    }
    
    /// Method stop and remove loading
    public func stopLoading() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
    
    // MARK: - Private Methods
    private func rotateAnimation(forView view: UIView) {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        view.layer.add(rotation, forKey: "rotationAnimation")
    }
}
