//
//  AddViewController.swift
//  UiTVC
//
//  Created by 吳政緯 on 2016/12/2.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class AddViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var Textview: UITextField!
    var movieData: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Textview.returnKeyType = .done
        Textview.placeholder = "請輸入文字"
        Textview.delegate = self
      
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
        
    @IBAction func Save(_ sender: UIBarButtonItem) {
    
       movieData = Textview.text!
        
        performSegue(withIdentifier: "Saver", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! TableViewController
        guest.movies.append(movieData)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        
        return true
    }
    
    
    
    }
