//
//  ServerCell.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/2/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit

class ServerCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var serverImageView: UIImageView!
    @IBOutlet weak var serverLocationLabel: UILabel!
    @IBOutlet weak var serverModelLabel: UILabel!
    @IBOutlet weak var ipMaskLabel: UILabel!
    @IBOutlet weak var ipAddressLabel: UILabel!
    @IBOutlet weak var doneImageView: UIImageView!
    @IBOutlet weak var callImageView: UIImageView!
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var muteImageView: UIImageView!
    @IBOutlet weak var cpuButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: Properties
    
    // MARK: Override Functions
    // awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    // MARK: Methods
    // configuration: to configure any protocols
    
    func configuration(response: ServerResponse){
        //there's no return from APis called server image, it's look like static image
       // serverImageView.image = UIImage(named: re)
        
        serverModelLabel.text = "\(response.model.name)"
        serverLocationLabel.text = "\(response.name)"
        ipMaskLabel.text = "\(response.ipSubnetMask ?? DefaultResponse.responseText)"
        ipAddressLabel.text = "\(response.ipAddress  ?? DefaultResponse.responseText)"
        switch response.status.id {
        case .green: statusImageView.load(name: Constants.StatusGreen)
        case .orange: statusImageView.load(name: Constants.StatusOrange)
        case .yellow: statusImageView.load(name: Constants.StatusYellow)
        case .red: statusImageView.load(name: Constants.StatusRed)
        case .blue:statusImageView.load(name: Constants.StatusBlue)
        }
        //there's no return from APis called CPU
        //cpuButton.setTitle("\(response.)", for: .normal)
    }
    
    func setupUI(){
        
       containerView.addShadow(withCorner: 0.0, borderColor: .white, borderWidth: 0.0, shadowColor: .lightGray, shadowOffset: CGSize(width: 0.0, height: 0.5), shadowRadius: 0.0, shadowOpacity: 0.3)
        cpuButton.roundView(withCorner: cpuButton.frame.height/2, borderColor: UIColor.LightGray(), borderWidth: 1.0)
    }
    
    func changeSelectedCellColor(){
        self.containerView.backgroundColor = UIColor.Lightblue()
    }
    
    func changeDeselectedCellColor(){
        self.containerView.backgroundColor = UIColor.white
    }
}
