//
//  PopViewController.swift
//  3DTouchDemo
//
//  Created by 吳政緯 on 2017/1/21.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    
    
    @IBOutlet weak var peekButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
        
    }
   

}
