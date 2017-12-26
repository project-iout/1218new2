//
//  MyCollectionViewCell4.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/25.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyCollectionViewCell4: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myTable2: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TTTTTableCell", for: indexPath) as! MyTableViewCell
        //        cell.textLabel?.text = "test123"
        cell.myLeftText.text = "L1"
        cell.myRightText.text = "R2"
        
        return cell
    }
    
    
    override func awakeFromNib() {
        print("awake My collectionView 4")
        super.awakeFromNib()
        
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        
        myTable2.register(nib, forCellReuseIdentifier: "TTTTTableCell")
        
        
        myTable2.dataSource = self
        myTable2.delegate = self
    }
    
}

