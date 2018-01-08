//
//  ThreeViewController.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/8.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    var myValue2:Int!
    @IBOutlet var myWebview2: UIWebView!
    @IBOutlet var label2: UILabel!
    @IBAction func backButton2(_ sender: UIButton) {
    }
    @IBAction func nextButton2(_ sender: UIButton) {
    }
   
    var visitThisURL:String?
    override func viewDidLoad() {
        super.viewDidLoad()
      
            if let url = visitThisURL{
                let urlObject = URL(string: url)
                myWebview2.loadRequest(URLRequest(url: urlObject!))
            
        }
        label2.text = "第"+String(myValue2)+"張圖片:"
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
