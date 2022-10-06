//
//  PlanetCustomCell.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import UIKit
import Alamofire


/// Responsible for show planet detail in collection view
class PlanetCustomCell: UICollectionViewCell {
    
    static let identifier = PlaneCustomCellString.identifier
    private var planetImageView : LazyImageView?
    private var titleLabel: UILabel?
    
    // Initializes and returns a newly allocated view object with the specified frame rectangle.
    /// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1.0

        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
       
        setupUI()
       
    }
    
    /// Returns an object initialized from data in a given unarchiver.
    /// - Parameter coder: An abstract class that serves as the basis for objects that enable archiving and distribution of other objects.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Instructs the view’s subviews to position within the view.
    override func layoutSubviews() {
        super.layoutSubviews()
        planetImageView?.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        titleLabel?.frame = CGRect(x: 10, y: contentView.frame.size.height - 60, width: contentView.frame.size.width, height:40)
    }
    
    /// Setup ui
    func setupUI() {
        
        planetImageView = LazyImageView()
        planetImageView?.contentMode = .scaleAspectFill
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel?.layer.shadowColor = UIColor.gray.cgColor
        titleLabel?.layer.shadowRadius = 2.0
        titleLabel?.layer.shadowOpacity = 0.08
        titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 15)
        titleLabel?.layer.masksToBounds = true
       
        if let imageView = planetImageView {
            contentView.addSubview(imageView)
        }
        if let label = titleLabel {
            contentView.addSubview(label)
        }
    }

    /// Set selected planet model form planet list
    /// - Parameter planetModel: The planet model
    func configure(planetModel:PlanetModel) {
        
        let strokeTextAttributes = [
          NSAttributedString.Key.strokeColor : UIColor.black,
          NSAttributedString.Key.foregroundColor : UIColor.white,
          NSAttributedString.Key.strokeWidth : -4.0,
          NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
          as [NSAttributedString.Key : Any]

        self.titleLabel?.attributedText = NSMutableAttributedString(string: planetModel.name, attributes: strokeTextAttributes)
        loadPlanetImage()
    }

    /// Load planet image
    private func loadPlanetImage() {
        
        let imageURL:String = "https://picsum.photos/seed"
        let randomSeed = Int.random(in: 1...600)
        let randomImageURL = "\(imageURL)/\(randomSeed)/200"
        
        AF.request(randomImageURL,method: .get).response{ response in
            
            switch response.result {
            case .success(let responseData):
                self.planetImageView?.image = UIImage(data: responseData!)
            case .failure(_):
                self.planetImageView?.image = UIImage(named: "PlaceHolder")
            }
            
        }
    }
}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}

   
