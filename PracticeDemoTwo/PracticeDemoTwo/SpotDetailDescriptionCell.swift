//
//  SpotDetailDescriptionCell.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/15.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation
import UIKit

class SpotDetailDescriptionCell:UITableViewCell{
    
    var taipeiParkSpotData: TaipeiParkSpotData?{
        didSet{
            parkNameLabel.text = taipeiParkSpotData?.parkName
            nameLabel.text = taipeiParkSpotData?.name
            openTimeLabel.text = "開放時間：\(taipeiParkSpotData?.openTime ?? "") "
            introductionLabel.text =  taipeiParkSpotData?.introduction
            
        }
    }
    
    @IBOutlet private weak var parkNameLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var openTimeLabel: UILabel!
    
    @IBOutlet private weak var introductionLabel: UILabel!{
        didSet{
            introductionLabel.sizeToFit()
            introductionLabel.numberOfLines = 0
        }
    }
    
}
