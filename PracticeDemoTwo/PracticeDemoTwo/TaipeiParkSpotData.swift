//
//  TaipeiParkSpotData.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation



struct   TaipeiParkSpotData {
    
    var parkName:String
    var name:String
    var openTime:String
    var introduction:String
    var imageURL:String
    
    
    init(data:NSDictionary) {
        self.parkName = data["ParkName"] as! String
        self.name   = data["Name"] as! String
        self.openTime   = data["OpenTime"] as! String
        self.introduction   = data["Introduction"] as! String
        self.imageURL   = data["Image"] as! String
    }
    
    
    
    
}
