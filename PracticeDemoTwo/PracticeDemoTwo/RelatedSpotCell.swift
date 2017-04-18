//
//  RelatedSpotCell.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/15.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation
import UIKit

class RelatedSpotCell:UITableViewCell{
    
    
    var taipeiParkSpotDatas = [TaipeiParkSpotData]()
    
    @IBOutlet private weak var relatedSpotCollectionVeiw: UICollectionView!
        
}


extension RelatedSpotCell:UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return taipeiParkSpotDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "relatedSpotCollectionCell", for: indexPath as IndexPath)
        if let relatedSpotCollectionCell = cell as? RelatedSpotCollectionCell{
            relatedSpotCollectionCell.imageURL = URL(string:taipeiParkSpotDatas[indexPath.row].imageURL)
            relatedSpotCollectionCell.parkName = taipeiParkSpotDatas[indexPath.row].name
            return relatedSpotCollectionCell
        }else{
            return cell
        }
        
        
        
    }
    
}


