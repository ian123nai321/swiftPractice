//
//  Utils.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation


class Utils {
    
    
    //拆解後端給的原始Data變成JSON後再放到Model中
    class func turnJSONToParkSpotData(oringinData: Data?) ->[TaipeiParkSpotData] {
        
        var taipeiParkSpotData = [TaipeiParkSpotData]()
        
        do {
            
            if let jsonArray = try JSONSerialization.jsonObject(with: oringinData!, options: []) as? [NSDictionary]{
                
                for json in jsonArray{
                    let json = TaipeiParkSpotData(data: json)
                    taipeiParkSpotData.append(json)
                    
                    
                }
            }
            return taipeiParkSpotData
            
            
        } catch {
            
            return taipeiParkSpotData
            
        }
    }
    
    
}
