//
//  MyCollectionViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/18.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyCollectionViewCell2: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var images:[UIImage]?
    var myCellSize:CGSize?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("CCC")
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayedImageCell", for: indexPath) as? ImageCollectionViewCell
        
        cell?.displayedImage.image = images?[indexPath.item]
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print(indexPath)
        print(indexPath.section)
        
        switch indexPath.section{
        case 0:
            print("This item is in the third row")
      
            
        default:
            print("This is wrong")
        }
        return true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("my width = \(myCellSize?.width), my height=\(myCellSize?.height)")
        return self.myCellSize!
    }
    
    @IBOutlet var insideCollectionView2: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from nib222")
        insideCollectionView2.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "displayedImageCell")
        insideCollectionView2.delegate  = self
        insideCollectionView2.dataSource = self
    }
}
