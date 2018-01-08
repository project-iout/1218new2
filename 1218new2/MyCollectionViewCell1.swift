//
//  MyCollectionViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/18.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyCollectionViewCell1: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var images:[UIImage]?
    var myCellSize:CGSize?
    var myLabel2:[String]?
    var urls:[String] = ["https://www.apple.com", "https://www.youtube.com", "https://www.mobile01.com", "https://world.taobao.com/?scm=20140651.100.2.zAk4jVZO3Ow1srpUVSV&ali_trackid=2:mm_26632535_17514134_131180164:1515415707_325_1672834303&clk1=64f826e791ce7082b050157810419b48&upsid=64f826e791ce7082b050157810419b48"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("bbbb")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayedImageCell", for: indexPath) as? ImageCollectionViewCell
        
        cell?.displayedImage.image = images?[indexPath.item]
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print(indexPath)
        print(indexPath.section)
        
        
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let vc1 = ThreeViewController(nibName: "ThreeViewController", bundle: nil)
            vc1.myValue2 = indexPath.item
            vc1.visitThisURL = urls[indexPath.item]
            topController.present(vc1, animated: true, completion: nil)
        }
        
        switch indexPath.section{
        case 0:
            print("11 This item is in the second row")
            
            
            
        default:
            print("This is wrong")
        }
        return true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          print("my width = \(myCellSize?.width), my height=\(myCellSize?.height)")
        return self.myCellSize!
    }

    @IBOutlet var insideCollectionView1: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from nib111")
        insideCollectionView1.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "displayedImageCell")
        insideCollectionView1.delegate  = self
        insideCollectionView1.dataSource = self
}
}
