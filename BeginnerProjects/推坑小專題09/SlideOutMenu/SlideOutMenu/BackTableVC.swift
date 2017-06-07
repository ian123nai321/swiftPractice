//
//  File.swift
//  SlideOutMenu
//
//  Created by 吳政緯 on 2017/1/13.
//  Copyright © 2017年 吳政緯. All rights reserved.
//

import Foundation

class BackTableVC:UITableViewController{
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Hello","Second","World"]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:TableArray[indexPath.row], for: indexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        return cell
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! ViewController
//        
//        var indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
//        
//        destVC.varView = indexPath.row
//    }
//    
}
