//
//  ViewController.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2017/12/18.
//  Copyright © 2017年 aa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var images = [UIImage]()
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AAAB", for: indexPath) as? MyCollectionViewCell

            cell?.myCellSize = CGSize(width: 265, height: 180)
            cell?.images = [(UIImage(named: "24"))!, (UIImage(named: "1"))!, (UIImage(named: "2"))!, (UIImage(named: "3"))!, (UIImage(named: "4"))!, (UIImage(named: "5"))!, (UIImage(named: "6"))!, (UIImage(named: "7"))!]
            return cell!

        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BBBB", for: indexPath) as? MyCollectionViewCell1

            cell?.myCellSize = CGSize(width: 180, height: 160)
            cell?.images = [(UIImage(named: "19"))!, (UIImage(named: "21"))!, (UIImage(named: "22"))!, (UIImage(named: "20"))!]
            return cell!
        }
            

        else if indexPath.section == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FFFF", for: indexPath) as?MyCollectionViewCell2

            cell?.myCellSize = CGSize(width: 180, height: 160)
            cell?.images = [(UIImage(named: "6"))!, (UIImage(named: "7"))!, (UIImage(named: "8"))!, (UIImage(named: "9"))!, (UIImage(named: "10"))!, (UIImage(named: "11"))!, (UIImage(named: "12"))!, (UIImage(named: "13"))!, (UIImage(named: "14"))!]
            return cell!
        }



        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QQQ", for: indexPath) as?MyTableViewCell
         
//            var restaurantName = ["SPAO", "Campus", "Ali", "QB", "AVOS"]
            cell?.words = ["SPAO", "Campus", "Ali", "QB", "AVOS"]
            return cell!
        }
        
        
        
    }
    
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: self.view.frame.width, height: 200)
        case 1:
            return CGSize(width: self.view.frame.width, height: 150)
        case 2:
            return CGSize(width: self.view.frame.width, height: 150)
        case 3:
            return CGSize(width: self.view.frame.width, height: 150)
        default:
            return .zero
        }
     
        
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as? MyHeaderView
            switch indexPath.section{
            case 0:
                header?.titleLebel.text = "熱門景色"
                header?.titleLebel.font = UIFont.systemFont(ofSize: 17)
            case 1:
                header?.titleLebel.text = "火線話題"
            case 2:
                header?.titleLebel.text = "精選學校"
            case 3:
                header?.titleLebel.text = "最後一則"
            default:
                header?.titleLebel.text = "沒有設定"
          
            }
            
            
            
            //test
            
           
//            header?.backgroundColor = .yellow
            header?.titleLebel.textColor = .black
           
            return header!}
            else{
            let footer  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath) as? MyFooterView
            
            switch indexPath.section{
            case 0:
                footer?.footerTitle.text = "依據師資、校園設備、學生滿意度評比各校"
            case 1:
                footer?.footerTitle.text = "內文1"
            case 2:
                footer?.footerTitle.text = "內文2"
            case 3:
                footer?.footerTitle.text = "此頁見底"
            default:
                footer?.footerTitle.text = "沒有設定"
            }
            
        
            footer?.footerTitle.textColor = .gray
//            footer?.backgroundColor = .green
            return footer!
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 20)
    }
    
    @IBOutlet var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let mainCollectionView = self.mainCollectionView{
            
            mainCollectionView.register(
                UINib(nibName: "MyCollectionViewCell", bundle: nil),
                forCellWithReuseIdentifier: "AAAB"
            )
            
            mainCollectionView.register(
                UINib(nibName: "MyCollectionViewCell1", bundle: nil),
                forCellWithReuseIdentifier: "BBBB"
            )
            
            mainCollectionView.register(
                UINib(nibName: "MyCollectionViewCell2", bundle: nil),
                forCellWithReuseIdentifier: "FFFF"
            )
            mainCollectionView.register(
                UINib(nibName: "MyTableViewCell", bundle: nil),
                forCellWithReuseIdentifier: "QQQ")
         
            mainCollectionView.register(UINib(nibName: "MyHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
            
            mainCollectionView.register(UINib(nibName: "MyFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



