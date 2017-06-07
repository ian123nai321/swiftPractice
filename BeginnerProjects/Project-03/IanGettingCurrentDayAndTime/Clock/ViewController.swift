//
//  ViewController.swift
//  Clock
//
//  Created by 吳政緯 on 2016/11/24.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

// import libraries
import UIKit

class ViewController: UIViewController {

    // global variables initialize
    let formatter = DateFormatter()
    var timer = Timer()
    
    // UI contents initialize
    @IBOutlet weak var autoRefresh: UIButton!
    @IBOutlet weak var Refresh: UIButton!
    @IBOutlet weak var timelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "MMM dd,yyyy,h:m:ss a"
        let date = Date()
        let result = formatter.string(from: date)
        timelabel.text = result
            }
    
    @IBAction func autoRefresh(_ sender: UIButton) {
       timer = Timer.scheduledTimer(timeInterval: 1.00, target: self, selector: #selector(ViewController.refresh), userInfo: nil, repeats: true)
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        let date = Date()
        let result = formatter.string(from: date)
        timelabel.text = result
    }
  
}

