//
//  SplashViewController.swift
//  加载界面：可以放广告
//
//  Created by pc on 2022/5/4.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //进入下一个界面
        //为了装一下，因为项目太小，不需要加载时间，特意设置几秒意思一下
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){  //线程里面相关的延时，老师应该不会问
            self.next()
        }
    }
    
    func next(){
        print("do Splash next()")
        
        //刚想了一下，这里还是太麻烦了，改一下
//        //这里的跳转和老师的不一样，老师好像只讲了跳转到单个界面，这里要跳转到指定界面，我上课没咋听讲
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
