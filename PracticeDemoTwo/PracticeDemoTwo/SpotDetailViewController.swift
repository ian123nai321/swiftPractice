//
//  SpotDetailViewController.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class SpotDetailViewController: UIViewController {
    
    var taipeiParkSpotData: TaipeiParkSpotData?
    var arrangedTaipeiParkSpotDatas = [TaipeiParkSpotData]()
    
    @IBOutlet weak var spotDetailTableView: UITableView!{
        didSet{
            spotDetailTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        }
    }
}

extension SpotDetailViewController:UITableViewDataSource{
    
    //有幾個section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //每個section有幾筆資料
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    //每筆資料內容為何
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch  indexPath.row {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "spotImageCell", for: indexPath)
            if let spotImageCell = cell as? SpotImageCell  {
                
                //spotImageCell只放入imageURL
                spotImageCell.imageURL = URL(string:(taipeiParkSpotData?.imageURL)!)
                return spotImageCell
            }else {
                return cell
            }
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "spotDetailDescriptionCell", for: indexPath)
            if let spotDetailDescriptionCell = cell as? SpotDetailDescriptionCell  {
                
                //spotDetailDescriptionCell放入taipeiParkSpotData
                spotDetailDescriptionCell.taipeiParkSpotData = taipeiParkSpotData
                return spotDetailDescriptionCell
            }else {
                
                return cell
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "relatedSpotCell", for: indexPath)
            if let spotDetailDescriptionCell = cell as? RelatedSpotCell  {
                
                //spotDetailDescriptionCell放入arrangedTaipeiParkSpotDatas
                spotDetailDescriptionCell.taipeiParkSpotDatas = arrangedTaipeiParkSpotDatas
                return spotDetailDescriptionCell
            }else {
                return cell
            }
            
        default:
            return UITableViewCell()
        }
    }
    
    
}


extension SpotDetailViewController:UITableViewDelegate{
    
    //cell的高度會隨著content內容多寡而改變
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch  indexPath.row {
        case 0:
            return 200
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            let height = max(UIScreen.main.bounds.height,UIScreen.main.bounds.width)
            return height/3.5
            
        default:
            return 0
        }
    }
    
    //cell的預設高度
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    
}





