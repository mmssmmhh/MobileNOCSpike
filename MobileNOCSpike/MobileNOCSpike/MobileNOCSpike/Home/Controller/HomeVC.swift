//
//  HomeVC.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/1/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var searchTextField: TextField!
    @IBOutlet weak var filterByAllButton: UIButton!
    @IBOutlet weak var filterByActiveButton: UIButton!
    @IBOutlet weak var filterByDownButton: UIButton!
    @IBOutlet weak var filterByLocationButton: UIButton!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var worldImageView: UIImageView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var controlImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sideBarView: UIView!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var notificationsRightView: UIView!
    
    // MARK: Properties
    var homeResponse: HomeResponse?
    
    // MARK: Override Functions
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    //viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHomeResponse()
    }
    
    // MARK: Methods
    // configuration: to configure any protocols
    private func configuration(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.serverCell, bundle: nil), forCellReuseIdentifier: Constants.serverCell)
    }
    
    
    // setupUI: to setup data or make a custom design
    private func setupUI(){
        setUIViews()
        setupUITextField()
        setupUIButton()
    }
    
    func setUIViews(){
        countView.roundViewSpecificCorners(corners: [.topLeft, .bottomLeft], radius: 8)
        notificationsRightView.addShadow(withCorner: 0.0, borderColor: .white, borderWidth: 0.0, shadowColor: .lightGray, shadowOffset: CGSize(width: -3.0, height: 0.0), shadowRadius: 10.0, shadowOpacity: 0.3)
        sideBarView.addShadow(withCorner: 0.0, borderColor: .white, borderWidth: 0.0, shadowColor: .lightGray, shadowOffset: CGSize(width: 3.0, height: 0.0), shadowRadius: 10.0, shadowOpacity: 0.3)
        
        navBarView.addShadow(withCorner: 0.0, borderColor: .white, borderWidth: 0.0, shadowColor: .lightGray, shadowOffset: CGSize(width: 0.0, height: 3.0), shadowRadius: 10.0, shadowOpacity: 0.3)
    }
    
    func setupUITextField(){
        searchTextField.radius = searchTextField.frame.height/2
    }
    
    func setupUIButton(){
        filterByActiveButton.cornerRadius =  filterByActiveButton.frame.height/2
        filterByDownButton.cornerRadius =  filterByDownButton.frame.height/2
        filterByLocationButton.cornerRadius =  filterByLocationButton.frame.height/2
        filterByAllButton.roundView(withCorner: filterByAllButton.frame.height/2, borderColor: UIColor.LightGray(), borderWidth: 1.0)
        filterByActiveButton.roundView(withCorner: filterByActiveButton.frame.height/2, borderColor: UIColor.LightGray(), borderWidth: 1.0)
        filterByDownButton.roundView(withCorner: filterByDownButton.frame.height/2, borderColor: UIColor.LightGray(), borderWidth: 1.0)
        filterByLocationButton.roundView(withCorner: filterByLocationButton.frame.height/2, borderColor: UIColor.LightGray(), borderWidth: 1.0)
        
    }
    
    // getting response from network layer
    private func getHomeResponse(){
        let services = HomeServices()
        self.showLoading()
        services.getHomeData { (error, data) in
            self.hideLoading()
            if let error = error {
                self.alertUser(title: "", message: error)
                return
            }
            
            guard let homeResponse = data else {return}
            self.homeResponse = homeResponse
            self.tableView.reloadData()
        }
    }
    
    // MARK: Actions
    

}
