//
//  FilterViewController.swift
//  iOS Challenge3
//
//  Created by 吳政緯 on 2017/4/18.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation
import UIKit

protocol PassSelectedRangeOfPriceDelegate {
    func pass(priceBound:[(Int,Int)])
}
class FilterViewController:UIViewController {
    var passSelectedRangeOfPrice:PassSelectedRangeOfPriceDelegate?
    var rangePrice : [(Int,Int)] = [(0,10),(11,50),(51,100),(101,150),(151,200)]

    @IBOutlet weak var rangeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rangeTableView.allowsMultipleSelection = true
    }
    
    @IBAction func finishFilter(_ sender: UIButton) {
        
        if let selectedIndexPath = rangeTableView.indexPathsForSelectedRows{
            
            let selectedRangePrice = selectedIndexPath.map{ indexPath in return rangePrice[indexPath.row] }

           passSelectedRangeOfPrice?.pass(priceBound: selectedRangePrice )
        }
        dismiss(animated: true)
        
    }

}



extension FilterViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section != 0{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
}

extension FilterViewController:UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return rangePrice.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
            
            if let nameCell = cell as? NameCell{
                
                return nameCell
            }else{
                
                return cell
                
            }
        case 1:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "rangeOfProductCell", for: indexPath)
            
            if let nameCell = cell as? RangeOfProductCell{
                nameCell.textLabel?.text = "\(rangePrice[indexPath.row].0)元～\(rangePrice[indexPath.row].1)元"
                return nameCell
            }else{
                
                return cell
                
            }
        case 2:
            let  cell = tableView.dequeueReusableCell(withIdentifier: "doneCell", for: indexPath)
            
            if let nameCell = cell as? DoneCell{
                
                return nameCell
            }else{
                
                return cell
                
            }
            
        default:
            return UITableViewCell()
        }
        
    }
}

