//
//  LoginOrRegisterViewController.swift
//  登录页
//
//  Created by pc on 2022/5/5.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var tfusername: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    
    //实现从注册界面返回
    @IBAction func goback(segue: UIStoryboardSegue){
        
    }
    
    //跳转到首页：判断账号密码
    @IBAction func toHome(_ sender: Any) {
        if(tfusername.text!.isEmpty){
            let p = UIAlertController(title: "登录失败", message: "用户名为空", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }
        if(tfpassword.text!.isEmpty){
            let p = UIAlertController(title: "登录失败", message: "密码为空", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }
        if(tfusername.text! == username && tfpassword.text! == password){
            AppDelegate.shared.toHome()
        }else{
            let p = UIAlertController(title: "登录失败", message: "用户名或密码错误", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
