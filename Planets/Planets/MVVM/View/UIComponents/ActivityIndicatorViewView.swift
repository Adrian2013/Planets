//
//  LoaderView.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import UIKit


/// Responsible for show activity idicator view
class ActivityIndicatorView:UIView {
    
    
    /// Initializes and returns a newly allocated view object with the specified frame rectangle.
    /// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    /// - Parameter coder: An abstract class that serves as the basis for objects that enable archiving and distribution of other objects.
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    /// Setup ui
    private func setupUI(){
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicatorView.color = ColorConstant.secounderyTextColor
        activityIndicatorView.center = self.center
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        addSubview(activityIndicatorView)
    }
    
}
