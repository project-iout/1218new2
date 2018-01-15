//
//  PostContent.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/15.
//  Copyright © 2018年 aa. All rights reserved.
//

import Foundation
import UIKit

class PostContent: UITableViewController{


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MytableViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as? MytableViewCellTableViewCell
        return cell!
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}
