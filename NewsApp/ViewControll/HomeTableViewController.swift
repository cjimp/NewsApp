//
//  HomeTableViewController.swift
//  首页：展示新闻数据
//
//  Created by pc on 2022/5/7.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeTableViewController: UITableViewController {
    

    //初始化:测试json是否读取
    func initHome(){
        //print(json)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化
        initHome()
        self.tableView.reloadData()
    }

    //实现点击cell跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="ShowDetail")
        {
            let detail = segue.destination as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow as IndexPath?
            let selectedIndex = indexPath!.row
            //print(selectedIndex)
            //print(json[selectedIndex]["url"].string!)
            detail.row = selectedIndex

        }
    }
    //实例化cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCellTableViewCell

        let cellrow = indexPath.row
        //print(cellrow)
        //修改布局
        tableView.rowHeight = 250

        cell.sourcelable.text = json[cellrow]["source"].string!
        cell.ptimelable.text = json[cellrow]["ptime"].string!
        cell.titlelable.text = json[cellrow]["title"].string!
        let url = URL(string: json[cellrow]["imgsrc"].string!)
        do{
            let data = try Data(contentsOf: url!)
            cell.imgsrc.image = UIImage(data: data)
        }catch let error as NSError{
            print(error.localizedDescription)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 40
    }
    
    
//    读取plist版本
//    var listData:[[String:String]]!
//
//    func initHome(){
//        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
//        let array = NSArray(contentsOfFile: plistPath!)
//        self.listData = array as! [[String : String]]
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initHome()
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if(segue.identifier=="ShowDetail")
//        {
//            let detail = segue.destination as! DetailViewController
//            let indexPath = self.tableView.indexPathForSelectedRow as IndexPath?
//           // print(indexPath)
//            let selectedIndex = indexPath!.row
//            //print(selectedIndex)
//
//            let dict = self.listData[selectedIndex]
//            detail.url = dict["url"]
//        }
//    }
//    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCellTableViewCell
//
//        let row = indexPath.row
//        let rowDict = self.listData[row] as! [String:String]
//        //修改布局
//        tableView.rowHeight = 60
//        cell.namelable.frame = CGRect(x: 80, y: 5, width: 200, height: 30)
//        cell.datelable.frame = CGRect(x: 80, y: 35, width: 200, height: 20)
//        cell.myImage.frame = CGRect(x: 20, y: 5, width: 50, height: 50)
//        cell.myImage.layer.cornerRadius = 25
//
//        //
//        let imagepath = rowDict["image"]
//        cell.myImage?.image=UIImage(named: imagepath!)
//        cell.namelable.text = rowDict["name"]
//        cell.datelable.text = rowDict["date"]
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 40
//    }

}
