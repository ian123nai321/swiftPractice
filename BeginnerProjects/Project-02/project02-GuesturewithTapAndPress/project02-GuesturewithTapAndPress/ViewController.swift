//
//  ViewController.swift
//  project02-GuesturewithTapAndPress
//
//  Created by 吳政緯 on 2016/12/18.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var timer: Timer?
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var tapOrHold: UIButton!
    
    func buttonTap(sender: UIGestureRecognizer) {
        counter += 1
        counterLabel.text = String(counter)
    }
    
    func buttonPress(sender: UIGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(buttonTap), userInfo: nil, repeats: true)
           
        }
        else if sender.state == .ended {
           timer?.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.buttonTap))
        let gesturePress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.buttonPress))
        tapOrHold.addGestureRecognizer(gestureTap)
        tapOrHold.addGestureRecognizer(gesturePress)
    }

    @IBAction func reset(_ sender: UIButton) {
        counter = 0
        counterLabel.text! = String(counter)
    }
}

