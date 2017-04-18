//
//  InfoCardViewController.swift
//  Project18
//
//  Created by 吳政緯 on 2017/4/10.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit


protocol PassedNewDataDelegate {
    func changeData(rowOfData selectedRow:Int,data contactInformationData:ContactInformation)
}




class InfoCardViewController: UIViewController {
    var selectedRow:Int!
    var passedValue:ContactInformation?
    var delegate:PassedNewDataDelegate?
    
    @IBOutlet weak var profilePictureView: UIImageView!{
        didSet{
            profilePictureView.contentMode = .scaleAspectFill
            profilePictureView.layer.masksToBounds = false
            profilePictureView.layer.cornerRadius = profilePictureView.frame.height/2
            profilePictureView.clipsToBounds = true
            profilePictureView.image = passedValue?.photo
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var changeNameTextField: UITextField!{
        didSet{
            changeNameTextField.returnKeyType = .done
            changeNameTextField.placeholder = "請輸入文字"
            changeNameTextField.borderStyle = .roundedRect
            changeNameTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = passedValue?.name
        phoneNumberLabel.text = passedValue?.phoneNumber
        
    }
    
    @IBAction func finishChangingValue(_ sender: Any) {
        delegate?.changeData(rowOfData:selectedRow , data:passedValue! )
        self.navigationController?.popViewController(animated: true)
    }
}


extension InfoCardViewController:UITextFieldDelegate{
    
    //按下右下角會完成編輯並隱藏keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text != ""{
            nameLabel.text = textField.text
            passedValue?.name = textField.text!
            textField.text = nil
        }
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    
    //點螢幕其他地方keyboard會隱藏
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}



