//
//  ThreeViewController.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/10.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    var myValue1:Int!
    @IBOutlet var myWebview1: UIWebView!
    @IBOutlet var label1: UILabel!
    @IBAction func nextButton1(_ sender: UIBarButtonItem) {
    }
    @IBAction func backButton1(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
    }
    
    var visitThisURL:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = visitThisURL{
            let urlObject = URL(string: url)
            myWebview1.loadRequest(URLRequest(url: urlObject!))
        }
        label1.text = "第"+String(myValue1)+"張圖片:"
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
