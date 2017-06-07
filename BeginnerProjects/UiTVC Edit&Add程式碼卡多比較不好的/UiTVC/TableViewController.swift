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
        tableView.reloadData()
        

       
    }
    
    
    
    @IBOutlet weak var Edit: UIBarButtonItem!
    
     var movies = ["qweommovie","fmov","amov"]
    
    
    
    
    
    func refresher() {
        movies.append("sdfdsfrrr")
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
        
    }
  /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return  true
    }詢問可不可以用直接左右滑方式編輯
*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! AddViewController
       guest.movieData = movies
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       movies.remove(at: indexPath.row)
        tableView.reloadData()

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
    
    
    
    @IBAction func Edit(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    


}
