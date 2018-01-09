//
//  MyCollectionViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/18.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var myViewController: ViewController!

//    @IBOutlet var myPage: UIPageControl!
    @IBOutlet weak var pageControl: UIPageControl!

//    var timer : Timer!
//    var updateCounter : Int!
    
    var images:[UIImage]?{
        didSet{
            //do something here ,   cell.insideCollectionView.reloadData()
        }
    }
    var myCellSize:CGSize?
    
    var navigationController: UINavigationController?
    
    var lableName:[String]?
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("aaa")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayedImageCell", for: indexPath) as? ImageCollectionViewCell
        
        cell?.displayedImage.image = images?[indexPath.item]
        return cell!
    }
    
  
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print(indexPath.item)
        print(indexPath.section)
        
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            let vc = TwoViewController(nibName: "TwoViewController", bundle: nil)
            vc.myValue = indexPath.item
            topController.present(vc, animated: true, completion: nil)
        }

        
        switch indexPath.section{
        case 0:
            print("This item is in the first row")
    
    
            
        default:
            print("This is wrong")
        }
        return true
    }
    
    
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        print("my width = \(myCellSize!.width), my height=\(myCellSize!.height)")
        return self.myCellSize!
    }
    
    @IBOutlet var insideCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awake from nib000")
        insideCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "displayedImageCell")
        insideCollectionView.delegate  = self
        insideCollectionView.dataSource = self
        
       
        
    }

}
