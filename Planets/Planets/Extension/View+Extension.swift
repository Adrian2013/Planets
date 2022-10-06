//
//  View+Extension.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import UIKit


extension UIView {

    /// Show activity indicator
    func showLoadingView() {
        if let removeExistingLoadingView = self.viewWithTag(8){
           removeExistingLoadingView.removeFromSuperview()
        }
        let activityIndicatorView = ActivityIndicatorView(frame: self.frame)
        activityIndicatorView.tag = 8
        self.addSubview(activityIndicatorView)
        self.bringSubviewToFront(activityIndicatorView)
    }
    
    /// Dismiss activity indicator
    func dismissLoadingView() {
        if let removeExistingLoadingView = self.viewWithTag(8){
            removeExistingLoadingView.removeFromSuperview()
        }
    }
    
}
