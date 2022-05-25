//
//  MyinfoViewController.swift
//  个人信息页
//
//  Created by pc on 2022/5/23.
//

import UIKit

class MyinfoViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var lablepw: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = "账号：" + username
        lablepw.text = "密码：" + password
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
