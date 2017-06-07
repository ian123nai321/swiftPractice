//
//  TableViewController.swift
//  UiTVC
//
//  Created by 吳政緯 on 2016/12/2.
//  Copyright © 2016年 吳政緯. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresher), for: UIControlEvents.valueChanged)
    }
    
    @IBOutlet weak var Edit: UIBarButtonItem!
    
    @IBOutlet weak var Add: UIBarButtonItem!
    
    
     var movies = ["cccwed","f","a"]
    
    func refresher() {
        movies.append("sdfdsfrrr")
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    @IBAction func Add(_ sender: Any) {
      print(movies)
    }
    
    


}
