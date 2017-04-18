//
//  RelatedSpotCollectionCell.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/16.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation
import UIKit


class RelatedSpotCollectionCell:UICollectionViewCell{
    
    
    @IBOutlet private weak var parkImageView: UIImageView!{
        didSet{
            parkImageView.layer.masksToBounds = false
            parkImageView.layer.cornerRadius = 10
            parkImageView.clipsToBounds = true
        }
        
    }
    
    @IBOutlet private weak var nameLabel: UILabel!
    
 
    //設置或讀取nameLabel.text
    var parkName:String?{
        get{
            return nameLabel.text
        }
        set{
            return nameLabel.text = newValue
        }
    }
    //每當設置imageURL時使用預設圖片，並下載圖片
    var imageURL: URL? {
        didSet {
            spotImage = UIImage(named:"defaultImage.png")
            fetchImage()
        }
    }
    
    //設置或讀取spotImageView的image
    private var spotImage: UIImage? {
        get {
            return parkImageView.image
        }
        
        set {
            parkImageView.image = newValue
            parkImageView.contentMode = .scaleToFill
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents {
                    
                    DispatchQueue.main.async {
                        
                        if  self?.imageURL == url{
                            self?.spotImage = nil
                            self?.spotImage = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
    
}
