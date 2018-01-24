//
//  TwoViewController.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/4.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    var myValue:Int!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet var myWebview: UIWebView!
    @IBAction func nextButton(_ sender: UIButton) {
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "https://www.ioutback.com")
        myWebview.loadRequest(URLRequest(url: url!))
        
        
        
//        label1.text = "第"+String(myValue)+"張圖:"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
