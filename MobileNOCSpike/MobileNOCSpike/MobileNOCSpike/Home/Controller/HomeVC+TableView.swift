//
//  HomeVC+TableView.swift
//  MobileNOCSpike
//
//  Created by Mohamed Kelany on 3/2/19.
//  Copyright © 2019 Mohamed Kelany. All rights reserved.
//

import UIKit


extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let Cell:ServerCell = tableView.cellForRow(at: indexPath) as? ServerCell else {return}
        Cell.changeSelectedCellColor()
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let Cell:ServerCell = tableView.cellForRow(at: indexPath) as? ServerCell else {return}
        Cell.changeDeselectedCellColor()
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.homeResponse?.content.count else {return 0}
        return count
    }
    
    //store cell with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServerCell", for: indexPath) as? ServerCell else {return UITableViewCell()}
        
        if let serverResponse = self.homeResponse?.content {
            cell.configuration(response: serverResponse[indexPath.row])
        }
        
        return cell
    }
}


