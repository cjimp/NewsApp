//
//  CollectUITableViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/23.
//

import UIKit

class CollectTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Refresh(_ sender: Any) {
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="collection")
        {
            let detail = segue.destination as! CollectionViewController
            let indexPath = self.tableView.indexPathForSelectedRow as IndexPath?
            var selectedIndex = indexPath!.row
            detail.row = selectedIndex
            do{
                for user in try db.prepare(collectdata){
                    if(selectedIndex == 0){
                        selectedIndex = selectedIndex - 1
                        detail.testurl = user[url]!
                    }else{
                        selectedIndex = selectedIndex - 1
                    }
                }
            }catch{
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCellTableViewCell

        var cellrow = indexPath.row
        //修改布局
        tableView.rowHeight = 250
        do{
            for user in try db.prepare(collectdata){
                if(cellrow == 0){
                    cellrow = cellrow - 1
                    cell.sourcelable.text = user[source]
                    cell.ptimelable.text = user[ptime]
                    cell.titlelable.text = user[titles]
                    let url = URL(string: user[imgsrc]!)
                    do{
                        let data = try Data(contentsOf: url!)
                        cell.imgsrc.image = UIImage(data: data)
                    }catch let error as NSError{
                        print(error.localizedDescription)
                    }
                }else{
                    cellrow = cellrow - 1
                }
            }
        }catch{
            print(error)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var num = 0
        do{
            num = try db.scalar(collectdata.count)
        }catch{
            print(error)
        }
        return num
    }

 

}
