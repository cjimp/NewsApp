//
//  SplashViewController.swift
//  加载页：加载json，创建数据库
//
//  Created by pc on 2022/5/4.
//

import UIKit
import Alamofire
import SwiftyJSON
import SQLite

class SplashViewController: UIViewController {

    func request(url:String){
 //       let requesturl = "http://c.m.163.com/nc/article/headline/T1348647853363/0-40.html"
        let test = AF.request(url, method: .post).responseJSON { [self]response in
//            debugPrint(response)
//            print("-----------")
//            print(response.value)
//            print("-----------")
//            print(response.result)

//             由于测试过，就没有进行失败判断
//            print("-----------")
            let getjson = JSON(response.value)
//            print(json)
            let datajson = JSON(getjson["T1348647853363"])
            json = datajson
//            print(json)
//            print(datajson)
//            let title = json["T1348647853363"][0]["source"].string
//            print(title)
//            let test = datajson[0]["title"].string
//            print(test)
        }
    }
    
    func dbmanage(){
        do{
            db = try Connection(.temporary)
            
            try db.run(collectdata.create(ifNotExists: true) { t in     // CREATE TABLE
                t.column(id, primaryKey: true)
                t.column(url)
                t.column(titles)
                t.column(source)
                t.column(ptime)
                t.column(imgsrc)
            })
        }catch{
            print(error)
        }
    }
    
    //请求网络json数据，并对json数据进行解析
    func initsplash(){
        //太简单了，就没有进行封装
        let requesturl = "http://c.m.163.com/nc/article/headline/T1348647853363/0-40.html"
        request(url:requesturl)
        dbmanage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //进入下一个界面
        initsplash()
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
            self.next()
        }
    }
    
    func next(){
        print("do Splash next()")
        

//        //获取到当前的appdelegate对象
//
//        let appDele = UIApplication.shared.delegate as! AppDelegate
//
//        //获取对象之后就可以调用里面的方法了
//        appDele.toGuide()
        
        AppDelegate.shared.toGuide()
                
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
