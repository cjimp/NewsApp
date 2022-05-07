//
//  RegisterViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/5.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tfusername: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    @IBOutlet weak var tfpasswordagain: UITextField!
    
    @IBAction func btRegister(_ sender: Any) {
        if(tfusername.text!.isEmpty){
            let p = UIAlertController(title: "登录失败", message: "用户名为空", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }else{
        if(tfpassword.text!.isEmpty){
            let p = UIAlertController(title: "登录失败", message: "密码为空", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }else{
        if(tfpassword.text! == tfpasswordagain.text!){
            username = tfusername.text!
            password = tfpassword.text!
            AppDelegate.shared.toLogin()
        }else{
            let p = UIAlertController(title: "登录失败", message: "两次密码不一致", preferredStyle:.alert)
            p.addAction(UIAlertAction(title: "确定", style: .default, handler: {
                (act:UIAlertAction) in self.tfpassword.text = ""
            }))
            present(p, animated: false, completion: nil)
        }
        }
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
