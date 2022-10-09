//
//  ViewController.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-05.
//

import UIKit
import RxSwift
import RxCocoa


/// Responsible for show planet list
class ViewController: UIViewController {
    
    // MARK: Properties
    private let planetViewModel:PlanetViewModel = PlanetViewModel(
        service: AppServerClient()
    )
    private var collectionView:UICollectionView?
    let disposeBag = DisposeBag()
    
    
    // MARK: Life cycle methods
    ///Called after the view controller’s view has been loaded into memory
    override func viewDidLoad()  {
        super.viewDidLoad()
        setupUI()
        setupRx()
        planetViewModel.getPlanetsList()
    }
    
    // MARK: UI binding
    /// Bind the api response into ui
    private func setupRx(){
        
        planetViewModel.planetsPublisheSubject
            .observe(on: MainScheduler.instance)
            .bind(to: collectionView!.rx.items(cellIdentifier: PlanetCustomCell.identifier, cellType: PlanetCustomCell.self)){ row,data, cell in
                cell.configure(planetModel: data)
            }
            .disposed(by: disposeBag)
        
        planetViewModel.loadingStatusPublishSubject
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ status in
                if status {
                    self.view.showLoadingView()
                }else{
                    self.view.dismissLoadingView()
                }
                
            })
            .disposed(by: disposeBag)
        
        planetViewModel.errorPublishSubject
            .observe(on: MainScheduler.instance)
            .subscribe(onNext:{ error in
                self.showMessage(title: PlanetListViewString.errorMessageTitle, message: error.localizedDescription)
            })
            .disposed(by: disposeBag)
        

        collectionView?
            .rx
            .modelSelected(PlanetModel.self)
            .subscribe(onNext: { (model) in
                
                let planetDetailViewController = DetailViewController()
                planetDetailViewController.configure(selectedPlanetModel: model)
                self.navigationController?.pushViewController(planetDetailViewController, animated: true)

            }).disposed(by: disposeBag)
        
    }
    
    // MARK: UI related methods
    /// Setup ui elements to the view
    private func setupUI(){
        
        self.title = PlanetListViewString.title
        self.view.backgroundColor = ColorConstant.backgroundColor
      
        collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: UICollectionViewFlowLayout())
        let cellWidth : CGFloat = self.view.frame.size.width
        let cellheight : CGFloat = 300
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        collectionView?.setCollectionViewLayout(layout, animated: true)
        collectionView?.register(PlanetCustomCell.self, forCellWithReuseIdentifier: PlanetCustomCell.identifier)
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView ?? UICollectionView())
        
    }
    
    
    /// Show message
    /// - Parameters:
    ///   - title: The title
    ///   - message: The message
    private func showMessage(title: String, message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

