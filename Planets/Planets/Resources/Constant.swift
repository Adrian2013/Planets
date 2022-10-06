//
//  Constant.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import UIKit



struct PlanetDetailViewString {
    
    static var planetNameTitle    = "Planet Name    : "
    static var orbitalPeriodTitle = "Orbital Period : "
    static var gravityTitle       = "Gravity        : "
   
}

struct PlanetListViewString {
    
    static var title                = "Planet List"
    static var errorMessageTitle    = "Error"

}

struct PlaneCustomCellString {
    
    static var identifier        = "PlanetCustomCell"
    
}

struct ColorConstant {
    
    static var backgroundColor:UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        }
        return .black
    }
    static var primaryTextColor:UIColor {
        if #available(iOS 13.0, *) {
            return .label
        }
        return .white
    }
    
    static var sectionColor:UIColor {
        if #available(iOS 13.0, *) {
            return .secondarySystemBackground
        }
        return .gray
    }
    static let secounderyTextColor:UIColor = .gray
    static let primaryColor:UIColor = .systemOrange
}

