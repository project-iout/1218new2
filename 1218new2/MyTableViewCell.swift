//
//  MyTableViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/21.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyTableViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    var words: [String]?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)
        cell.textLabel?.text = words?[indexPath.row]
        
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "ZZZZ", for: indexPath)
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from nibzzz")
        // Initialization code
       
    }
    
    
}

