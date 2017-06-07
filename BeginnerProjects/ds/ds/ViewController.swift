//
//  ViewController.swift
//  ds
//
//  Created by 吳政緯 on 2016/11/16.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var tap: UIButton!
    
    @IBOutlet weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   var count = 0
   var timer = Timer()
    func countUp(){
        count += 1
        counter.text = String(count)
    }
   
    @IBAction func tapOrHold(_ sender: Any) {
        countUp()
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(ViewController.countUp), userInfo: nil, repeats: true)
    }
    
    @IBAction func tapholdup(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func reset(_ sender: Any) {
      count = 0
      counter.text = String(count)
    }

}

