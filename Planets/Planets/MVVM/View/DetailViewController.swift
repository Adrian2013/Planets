//
//  DetailViewController.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import UIKit

/// Responsible for  show planet details, after click from planet list
class DetailViewController: UIViewController {
    
    // MARK: Properties
    var labelPlanetName: UILabel!
    var labelOrbitalPeriod: UILabel!
    var labelGravity: UILabel!
    var planetModel:PlanetModel!
    
    
    // MARK: Life cycle methods
    /// Setup ui elements to the view
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        labelPlanetName?.text    =  PlanetDetailViewString.planetNameTitle + planetModel.name
        labelOrbitalPeriod?.text =  PlanetDetailViewString.orbitalPeriodTitle + planetModel.orbital_period
        labelGravity?.text       =  PlanetDetailViewString.gravityTitle + planetModel.gravity
       
    }
    
    // MARK: Config methods
    /// Set selected planet model form planet list
    /// - Parameter selectedPlanetModel: The planet model
    func configure(selectedPlanetModel:PlanetModel) {
        
        planetModel = selectedPlanetModel
        
    }
    
    // MARK: UI related methods
    /// Setup ui
    private func setupUI() {
        
        view = UIView()
        view.backgroundColor = .white
        addUIComponent()
        addConstariant()
        
    }
    
    /// Add Constariant
    private func addConstariant() {
        
        NSLayoutConstraint.activate([
            labelPlanetName.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 25),
            labelPlanetName.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            
            labelOrbitalPeriod.topAnchor.constraint(equalTo: labelPlanetName.bottomAnchor, constant: 45),
            labelOrbitalPeriod.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            
            labelGravity.topAnchor.constraint(equalTo: labelOrbitalPeriod.bottomAnchor, constant: 45),
            labelGravity.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
        ])
    }
    
    /// Add ui component
    private func addUIComponent() {
        
        self.view.backgroundColor = ColorConstant.backgroundColor
        labelPlanetName = UILabel()
        labelPlanetName.translatesAutoresizingMaskIntoConstraints = false
        labelPlanetName.font = UIFont.systemFont(ofSize: 14)
        labelPlanetName.textAlignment = .right
        labelPlanetName.text = PlanetDetailViewString.planetNameTitle
        labelPlanetName.numberOfLines = 3
        view.addSubview(labelPlanetName)
        
        labelOrbitalPeriod = UILabel()
        labelOrbitalPeriod.translatesAutoresizingMaskIntoConstraints = false
        labelOrbitalPeriod.font = UIFont.systemFont(ofSize: 14)
        labelOrbitalPeriod.text = PlanetDetailViewString.orbitalPeriodTitle
        labelOrbitalPeriod.numberOfLines = 3
        view.addSubview(labelOrbitalPeriod)
        
        labelGravity = UILabel()
        labelGravity.translatesAutoresizingMaskIntoConstraints = false
        labelGravity.font = UIFont.systemFont(ofSize: 14)
        labelGravity.text = PlanetDetailViewString.gravityTitle
        labelGravity.numberOfLines = 3
        labelGravity.textAlignment = .right
        view.addSubview(labelGravity)
        
    }
    
}
