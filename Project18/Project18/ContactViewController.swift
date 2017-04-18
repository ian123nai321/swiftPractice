//
//  ViewController.swift
//  Project18
//
//  Created by 吳政緯 on 2017/4/10.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    
    
    @IBOutlet var contactView: UITableView!
    
    //沒有後端暫時打在這裡的資料
    var contactInformationList : [ContactInformation] =
        [ContactInformation(name:"Ian",phoneNumber:"0912345678",photo:UIImage(named:"profileOne")! ),
         ContactInformation(name:"Johnson",phoneNumber:"0912837421",photo:UIImage(named:"profileTwo")!),
         ContactInformation(name:"Boshi",phoneNumber:"0929431782", photo:UIImage(named:"profileThree")!),
         ContactInformation(name:"Jerry",phoneNumber:"0912345566", photo:UIImage(named:"profileFour")!)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactView.dataSource = self
        contactView.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toInfoVC"{
            
            if let destinationVC = segue.destination as? InfoCardViewController
                ,let selectedRow = sender as? Int{
                destinationVC.passedValue = contactInformationList[selectedRow]
                destinationVC.delegate = self
                
                destinationVC.selectedRow = selectedRow
            }
            
        }
    }
}



extension ContactViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactInformationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactTableViewCell", for: indexPath)
        if let contactTableViewCell = cell  as? ContactTableViewCustomCell{
            contactTableViewCell.accessoryType = .disclosureIndicator
            
            contactTableViewCell.contactData = contactInformationList[indexPath.row]
            return contactTableViewCell
        }
        else{
            return cell
        }
    }
    
}

extension ContactViewController: UITableViewDelegate{
    
    //哪一行被點選，並可以委託給VC做一些事情
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = tableView.indexPathForSelectedRow{
            print("第\(indexPath.row)被點了！！")
            
            //sneder傳入indexPath.row，prepare(for segue）會用到
            performSegue(withIdentifier: "toInfoVC", sender: indexPath.row)
            
        }
        
    }
    
    
}


extension ContactViewController:PassedNewDataDelegate {
    
    //InfoCardViewController按下Done之後把值傳回ContactViewController
    func changeData(rowOfData selectedRow:Int,data contactInformationData:ContactInformation){
        contactInformationList[selectedRow] = contactInformationData
        contactView.reloadData()
    }
    
    
}



