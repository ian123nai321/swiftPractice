//
//  ViewController.swift
//  PracticeDemoTwo
//
//  Created by 吳政緯 on 2017/4/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import UIKit

class SpotViewController: UIViewController {
    
    //台北公園資料
    var taipeiParkSpotDatas = [TaipeiParkSpotData]()
    //分類過的資料
    var arrangedTaipeiParkSpotDatas = [String:[TaipeiParkSpotData]]()
    //存放公園名稱
    var totalParkNames = [String]()
    
    @IBOutlet weak var spotTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getData(from:"SpotData"){ data in
            self.taipeiParkSpotDatas  = Utils.turnJSONToParkSpotData(oringinData: data)
            self.arrangeTaipeiParkSpotData(self.taipeiParkSpotDatas)
            
        }
        
        
    }
    
    //從本地端得到JSON轉成Data並傳到其他函式使用
    func getData(from dataName:String, completion: @escaping (Data?)->Void ) {
        let path=Bundle.main.path(forResource: dataName, ofType: "json")
        let jsonData = NSData(contentsOfFile: path!) as Data?
        completion(jsonData)
        
    }
    
    //分類資料，相同類型資料放一起
    func arrangeTaipeiParkSpotData(_ data:[TaipeiParkSpotData]){
        
        
        for data in taipeiParkSpotDatas {
            
            if arrangedTaipeiParkSpotDatas[data.parkName]  != nil {
                arrangedTaipeiParkSpotDatas[data.parkName]?.append(data)
            }else{
                arrangedTaipeiParkSpotDatas[data.parkName] = [data]
                //額外存放公園名稱方便日後使用
                totalParkNames.append(data.parkName)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSpotDetailVC"{
            
            if let destinationVC = segue.destination as? SpotDetailViewController
                ,let indexPath = sender as? IndexPath{
                if let taipeiParkSpotDatas = arrangedTaipeiParkSpotDatas[totalParkNames[indexPath.section]] {

                destinationVC.arrangedTaipeiParkSpotDatas = taipeiParkSpotDatas
                let parkName = totalParkNames[indexPath.section]
                destinationVC.taipeiParkSpotData  =  arrangedTaipeiParkSpotDatas[parkName]?[indexPath.row]
                }
                
            }
            
        }
    }
}



extension SpotViewController:UITableViewDataSource{
    
    //有幾個section
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrangedTaipeiParkSpotDatas.count
    }
     //每個section有幾筆資料
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfRows = arrangedTaipeiParkSpotDatas[totalParkNames[section]]?.count{
            return numberOfRows
        }else{
            
        return 1
            
        }
        
    }
   //每筆資料內容為何
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkSpotCell", for: indexPath)
        if let spotTableViewCell = cell as? SpotTableViewCell  {
            
            spotTableViewCell.spotData = arrangedTaipeiParkSpotDatas[totalParkNames[indexPath.section]]?[indexPath.row]
            return spotTableViewCell
        }
        else {
            return cell
        }
    }
    
    //header顯示的名稱
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let parkName = totalParkNames[section]
        return parkName
    }
    
}


extension SpotViewController:UITableViewDelegate{
    
    //cell的高度會隨著content多寡而改變
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    //cell的預設高度
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    //哪一行被點選，並做一些事情
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = tableView.indexPathForSelectedRow{
            print("第\(indexPath.section)區塊的第\(indexPath.row)被點了！！")
            
            //sneder傳入indexPath，prepare(for segue）會用到
            performSegue(withIdentifier: "toSpotDetailVC", sender: indexPath)
            
        }
        
    }
}




