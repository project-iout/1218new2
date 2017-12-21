//
//  MyTableViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/21.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyTableViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ZZZZ", for: indexPath)
    
     
        return cell
        
        
    }
    
    
    var words: [String]?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (words!.count)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("ZZZZ")
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: "displayImageCell", for: indexPath) as?ImageCollectionViewCell

    }
    
    @IBOutlet var myTable: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
