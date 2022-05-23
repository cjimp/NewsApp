//
//  CollectionViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/23.
//

import UIKit

class CollectionViewController: UIViewController, UIWebViewDelegate {
    var row:Int!

    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func removecollect(_ sender: Any) {
    }
    
    func initcollection(){
        
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
