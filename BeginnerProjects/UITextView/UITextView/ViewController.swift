//
//  ViewController.swift
//  UITextView
//
//  Created by 吳政緯 on 2016/11/18.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    var myTextView: UITextView!
    func sendMail() {
        print("sendMail")
    }
    
    func sendFB() {
        print("sendFB")
    }
    func hideKeyboard(tapG:UITapGestureRecognizer){
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        self.myTextView.resignFirstResponder()
    }

    
        override func viewDidLoad() {
        super.viewDidLoad()
        myTextView = UITextView(
            frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        myTextView.backgroundColor = UIColor.darkGray
        
        // 文字顏色
        myTextView.textColor = UIColor.white
        
        // 文字字型及大小
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        
        // 文字向左對齊
        myTextView.textAlignment = .left
        
        // 預設文字內容
        myTextView.text = "Swift 起步走"
        
        // 適用的鍵盤樣式 這邊選擇預設的
        myTextView.keyboardType = .numberPad
        
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        myTextView.returnKeyType = .default
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 設置於畫面的中間偏上位置
        myTextView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.3)
            // 加入畫面
            self.view.addSubview(myTextView)
        
        let mail = UIMenuItem(
            title: "寄送",
            action: #selector(ViewController.sendMail))
        let facebook = UIMenuItem(
            title: "FB",
            action: #selector(ViewController.sendFB))
            
        // 建立選單
        let menu = UIMenuController.shared
        
        // 將新的選項加入選單
        menu.menuItems = [mail,facebook]
            
            
            let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(ViewController.hideKeyboard(tapG:)))
            
            tap.cancelsTouchesInView = false
            
            // 加在最基底的 self.view 上
            self.view.addGestureRecognizer(tap)
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

