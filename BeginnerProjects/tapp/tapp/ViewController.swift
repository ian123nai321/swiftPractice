//
//  ViewController.swift
//  tapp
//
//  Created by 吳政緯 on 2016/11/19.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonTap: UIButton!
    @IBOutlet weak var counterView: UILabel!
    @IBOutlet weak var buttonHold: UIButton!
        var timer: Timer!
        var speedAmmo = 100
    func btHoldDOWN()

    @IBAction func touchdownTap(_ sender: Any) {
        counter += 1
        counterView.text = String(counter)
    }

    @IBAction func touchdownReset(_ sender: Any) {
        counter = 0
        counterView.text = "0"
        
    }
    @IBAction func touchdownHold(_ sender: Any) {
        counter += 1
        counterView.text = String(counter)
    }
    
}

