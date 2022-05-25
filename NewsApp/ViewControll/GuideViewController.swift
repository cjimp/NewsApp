//
//  GuideViewController.swift
//  引导页：首页轮播图
//
//  Created by pc on 2022/5/4.
//

import UIKit

class GuideViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var btLoginOrRegister: UIButton!
    @IBOutlet weak var btEnter: UIButton!
    
    var scrollview:UIScrollView!
    var pageControl:UIPageControl!
        
    var viewHeight = 0.0
    var viewWidth = 0.0
    
    @IBAction func Enter(_ sender: Any) {
        AppDelegate.shared.toHome()
    }
    @IBAction func Login(_ sender: Any) {
        print("touch btLoginOrRegister")
        AppDelegate.shared.toLogin()
    }
    
    //初始化轮播图
    func InitScroll(){
        viewHeight = self.view.frame.size.height-150
        viewWidth = self.view.frame.size.width
        
        let scollframe = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        self.scrollview = UIScrollView(frame: scollframe)
        self.scrollview.contentSize = CGSize(width: viewWidth*3, height: viewHeight)
        
        self.scrollview.isPagingEnabled = true
        self.scrollview.delegate = self
        
        let img1 = UIImage(named: "IMG_1")
        let imageview1 = UIImageView(image: img1)
        imageview1.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        self.scrollview.addSubview(imageview1)
        
        let img2 = UIImage(named: "IMG_2")
        let imageview2 = UIImageView(image: img2)
        imageview2.frame = CGRect(x: viewWidth, y: 0, width: viewWidth, height: viewHeight)
        self.scrollview.addSubview(imageview2)
        
        let img3 = UIImage(named: "IMG_3")
        let imageview3 = UIImageView(image: img3)
        imageview3.frame = CGRect(x: viewWidth*2, y: 0, width: viewWidth, height: viewHeight)
        self.scrollview.addSubview(imageview3)
        
        self.view.addSubview(self.scrollview)
        
        let w = 120.0
        let h = 30.0
        let pageframe = CGRect(x:(viewWidth - w)/2, y: viewHeight - h, width: w, height: h)
        
        self.pageControl = UIPageControl(frame: pageframe)
        self.pageControl.backgroundColor = UIColor.black
        self.pageControl.layer.cornerRadius = 15
        self.pageControl.alpha = 0.5
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        
        self.view.addSubview(self.pageControl)
        self.pageControl.addTarget(self, action:#selector(changePage(_:)), for: UIControl.Event.valueChanged)
    }
    //PageControl
    @objc func changePage(_ sender:AnyObject){
        UIView.animate(withDuration: 0, animations: {
            let whichpage = CGFloat(self.pageControl.currentPage)
            self.scrollview.contentOffset = CGPoint(x: whichpage*self.viewWidth, y: 0)
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollview.contentOffset
        self.pageControl.currentPage = Int(offset.x)/Int(viewWidth)
    }
    
    // 当前布局完成后
    override func viewDidLayoutSubviews() {
        //设置注册按钮圆角
        btLoginOrRegister.layer.cornerRadius = 20
        btEnter.layer.cornerRadius = 20
        //设置边框
        btEnter.layer.borderWidth = 1
        btEnter.layer.borderColor = UIColor(named: "ColorMain")?.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        InitScroll()
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
