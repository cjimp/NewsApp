//
//  AppDelegate.swift
//  NewsApp
//
//  Created by pc on 2022/5/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // 进入引导界面
    func toGuide(){
        print("do appdelegate toGuide")
        changeto(String: "Guide")
    }
    
    // 进入登录界面
    func toLogin(){
        print("do appdelegate toLogin")
        changeto(String: "Login")
    }
    
    //定义一个东西，是啥我也忘了，反正就是返回Appdelegate对象实例， 不是方法和函数
    //返回Appdelegate对象实例
    open class var shared: AppDelegate{
        get{
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    // 改变当前界面
    func changeto(String: String){
        //获取到Main.sotry
        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        //实例化Guide场景
        let controll = mainStory.instantiateViewController(withIdentifier: String)
        //替换根控制器
        self.window?.rootViewController = controll
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


}

