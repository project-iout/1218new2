//
//  MyCollectionViewCell3.swift
//  1218new2
//
//  Created by WengChihao on 23/12/2017.
//  Copyright © 2017 aa. All rights reserved.
//

import UIKit

class MyCollectionViewCell3: UICollectionViewCell , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    
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
        print("awake My collectionView 3")
        super.awakeFromNib()
        
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        
        myTable.register(nib, forCellReuseIdentifier: "TTTTTableCell")
        
        
        myTable.dataSource = self
        myTable.delegate = self
    }

}
