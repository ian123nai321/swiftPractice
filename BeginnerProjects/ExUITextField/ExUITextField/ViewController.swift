//
//  ViewController.swift
//  ExUITextField
//
//  Created by 吳政緯 on 2016/11/18.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
     var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTextView = UITextView(
            frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        // 背景顏色
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
        myTextView.keyboardType = .default
        
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        myTextView.returnKeyType = .default
        // 文字是否可以被編輯
        myTextView.isEditable = true
        
        // 文字是否可以被選取
        myTextView.isSelectable = true
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 設置於畫面的中間偏上位置
        myTextView.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.3)
        
        // 加入畫面
        self.view.addSubview(myTextView)
        
        let mail = UIMenuItem(
            title: "寄送",
            action: #selector(ViewController.send))
        let facebook = UIMenuItem(
            title: "FB",
            action: #selector(ViewController.sendFB))
        
        // 建立選單
        let menu = UIMenuController.shared
        
        // 將新的選項加入選單
        menu.menuItems = [mail,facebook]
        
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        }

