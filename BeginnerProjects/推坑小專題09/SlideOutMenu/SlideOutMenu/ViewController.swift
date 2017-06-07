//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by 吳政緯 on 2017/1/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Open: UIBarButtonItem!
    
    var varView = Int()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Open.target = self.revealViewController()
//        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
//        if (varView == 0){
//            Label.text =  "Strings"
//        }
//        else{
//    Label.text = "Others"
//        }
    }
   
}

