//
//  SpotImageCell.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/15.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation
import UIKit

class SpotImageCell: UITableViewCell {

  
    @IBOutlet private weak var spotImageView: UIImageView!{
        didSet{
            spotImageView.image = UIImage(named:"defaultImage.png")
            spotImageView.layer.masksToBounds = false
            spotImageView.layer.cornerRadius = 20
            spotImageView.clipsToBounds = true
        }
    }
    

    //設置imageURL並下載圖片
     var imageURL: URL? {
        didSet {
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
