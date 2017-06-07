//
//  ViewController.swift
//  Project2-練習
//
//  Created by 吳政緯 on 2016/12/18.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CountLabel: UILabel!
    var counter = 0
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CountLabel.text! = String(counter)
    }

    @IBAction func Reset(_ sender: Any) {
        counter  = 0
        CountLabel.text! = String(counter)
        
    }
    @IBAction func tapOrHold(_ sender: UIGestureRecognizer) {
        counter += 1
        CountLabel.text! = String(counter)
        
    }
    
    
    }

