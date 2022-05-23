//
//  CollectionViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/23.
//

import UIKit
import SQLite

class CollectionViewController: UIViewController, UIWebViewDelegate {
    var row:Int!
    var testurl:String!

    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func removecollect(_ sender: Any) {
        removecoll()
        let p = UIAlertController(title: "取消收藏成功", message: "已从收藏夹删除", preferredStyle:.alert)
        p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
            (act:UIAlertAction) in print("取消收藏成功")
        }))
        present(p, animated: false, completion: nil)
    }
    //从数据库删除
    func removecoll(){
        let delete = collectdata.filter(url == testurl)
        do{
            let count = try? db.run(delete.delete())
            print("删除的条数为：\(count)")
        }catch{
            print(error)
        }
    }
    
    func initcollection(){
        let requesturl = URL(string: testurl)
        let request = URLRequest(url: requesturl!)
        self.webview.loadRequest(request)
        self.webview.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initcollection()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
