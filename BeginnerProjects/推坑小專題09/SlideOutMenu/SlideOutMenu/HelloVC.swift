//
//  HelloVC.swift
//  SlideOutMenu
//
//  Created by 吳政緯 on 2017/1/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation

class HelloVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
