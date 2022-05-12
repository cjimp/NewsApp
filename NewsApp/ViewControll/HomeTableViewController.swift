//
//  HomeTableViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/7.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var listData:[[String:String]]!
    
    func initHome(){
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        let array = NSArray(contentsOfFile: plistPath!)
        self.listData = array as! [[String : String]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initHome()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="ShowDetail")
        {
            let detail = segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow as IndexPath?
           // print(indexPath)
            let selectedIndex = indexPath!.row
            //print(selectedIndex)
            
            let dict = self.listData[selectedIndex]
            detail.url = dict["url"]
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCellTableViewCell
        
        let row = indexPath.row
        let rowDict = self.listData[row] as! [String:String]
        //修改布局
        tableView.rowHeight = 60
        cell.namelable.frame = CGRect(x: 80, y: 5, width: 200, height: 30)
        cell.datelable.frame = CGRect(x: 80, y: 35, width: 200, height: 20)
        cell.myImage.frame = CGRect(x: 20, y: 5, width: 50, height: 50)
        cell.myImage.layer.cornerRadius = 25
        
        //
        let imagepath = rowDict["image"]
        cell.myImage?.image=UIImage(named: imagepath!)
        cell.namelable.text = rowDict["name"]
        cell.datelable.text = rowDict["date"]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }



}
