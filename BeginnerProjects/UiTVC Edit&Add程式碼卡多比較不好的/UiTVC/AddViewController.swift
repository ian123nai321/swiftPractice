//
//  AddViewController.swift
//  UiTVC
//
//  Created by 吳政緯 on 2016/12/2.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var Textview: UITextField!
    var movieData: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
        
    @IBAction func Save(_ sender: UIBarButtonItem) {
    
       movieData.append(Textview.text!)
        print(movieData)
        performSegue(withIdentifier: "Saver", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest1 = segue.destination as! TableViewController
        guest1.movies = movieData

    }
    
    
    
    }
