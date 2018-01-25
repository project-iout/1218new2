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

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet var frViewController: UIView!
    
    @IBOutlet var cellLabel: UILabel!
    
    
    var images:[UIImage]?{
        didSet{
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
    
    @IBAction func pageControl(_ sender: UIPageControl) {
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
            print("This item is in the 111111")
        case 1:
            print("This item is in the 222222")
        case 2:
            print("This item is in the 333333")
        case 3:
            print("This item is in the 4444444")
        default:
            print("This item is in the 555555")
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
