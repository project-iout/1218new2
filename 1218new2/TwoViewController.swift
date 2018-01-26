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
        
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func populate()
    {

    }

 
}
