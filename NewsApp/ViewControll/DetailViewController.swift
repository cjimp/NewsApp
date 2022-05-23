//
//  DetailViewController.swift
//  NewsApp
//
//  Created by pc on 2022/5/7.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {
    
    
    
    var url:String!
    var row:Int!
    
    @IBOutlet weak var webView: UIWebView!
    
    func initview() {
        
        
        let url=URL(string: url)
        
        let request=URLRequest(url: url!)
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
