//
//  SpotTableViewCell.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class SpotTableViewCell: UITableViewCell {
    
    var spotData : TaipeiParkSpotData?{
        didSet{
            parkNameLabel.text = spotData?.parkName
            spotDescriptionLabel.text = spotData?.introduction
            openTimeLabel.text = spotData?.openTime
            imageURL = URL(string:(spotData?.imageURL)!)
        }
    }
    
    
    
    
    @IBOutlet private weak var parkNameLabel: UILabel!
    
    @IBOutlet private weak var spotImageView: UIImageView! {
        
        didSet{
            spotImageView.layer.masksToBounds = false
            spotImageView.layer.cornerRadius = 10
            spotImageView.clipsToBounds = true
            
        }
    }
    
    //每當設置imageURL時使用預設圖片，並下載圖片
    private var imageURL: URL? {
        didSet {
            //預設圖片
            spotImage = UIImage(named:"defaultImage.png")
            fetchImage()
        }
    }
    
    //設置spotImageView的image
    private var spotImage: UIImage? {
        get {
            return spotImageView.image
        }
        
        set {
            spotImageView.image = newValue
            spotImageView.sizeToFit()
        }
    }

    
    @IBOutlet private weak var spotDescriptionLabel: UILabel!{
        didSet{
            spotDescriptionLabel.sizeToFit()
            spotDescriptionLabel.numberOfLines = 0

        }
    }
    
    @IBOutlet private weak var openTimeLabel: UILabel!
    
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


