//
//  DetailViewController.swift
//  首页详情页：新闻具体页面以及收藏按钮
//
//  Created by pc on 2022/5/7.
//

import UIKit
import SQLite

class DetailViewController: UIViewController, UIWebViewDelegate {
    var jsondata = datas(title: "test", source: "test", url: "test", ptime: "test", imgsrc: "test")
    var row:Int!
    
    @IBOutlet weak var btCollect: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    //收藏新闻
    @IBAction func collect(_ sender: Any) {
        addcollect()
        let p = UIAlertController(title: "收藏成功", message: "已收藏至收藏夹", preferredStyle:.alert)
        p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
            (act:UIAlertAction) in print("收藏成功")
        }))
        present(p, animated: false, completion: nil)
        
    }
    //添加到数据库
    func addcollect(){
        do{
            let rowid = try db.run(collectdata.insert(titles <- jsondata.title,
                                          url <- jsondata.url,
                                          source <- jsondata.source,
                                          ptime <- jsondata.ptime,
                                          imgsrc <- jsondata.imgsrc
                                         ))
            debugPrint("inserted id: \(rowid)")
            debugPrint(collectdata[source])

        }catch{
            print(error)
        }
    }
    //初始化数据
    func initview() {
        jsondata.title = json[row]["title"].string!
        print(jsondata.title)
        jsondata.imgsrc = json[row]["imgsrc"].string!
        jsondata.source = json[row]["source"].string!
        jsondata.url = json[row]["url"].string!
        print(jsondata.url)
        jsondata.ptime = json[row]["ptime"].string!
        print(jsondata)
        
        let requesturl = URL(string: jsondata.url)
        print(requesturl)
        let request = URLRequest(url: requesturl!)
        self.webView.loadRequest(request)
        self.webView.delegate=self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initview()
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
