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
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CellID", for:indexPath) as? MyCollectionViewCell{
            switch indexPath.section{
            case 0:
//                cell.insideCollectionView.backgroundColor = .blue
                cell.myCellSize = CGSize(width: 265, height: 180)
                cell.images = [(UIImage(named: "24"))!, (UIImage(named: "1"))!, (UIImage(named: "2"))!, (UIImage(named: "3"))!, (UIImage(named: "4"))!, (UIImage(named: "5"))!, (UIImage(named: "6"))!, (UIImage(named: "7"))!]
            case 1:
//                cell.insideCollectionView .backgroundColor = .yellow
                cell.myCellSize = CGSize(width: 180, height: 130)
                cell.images = [(UIImage(named: "19"))!, (UIImage(named: "21"))!, (UIImage(named: "22"))!, (UIImage(named: "20"))!]
            case 2:
//                cell.insideCollectionView .backgroundColor = .green
                cell.myCellSize = CGSize(width: 180, height: 130)
                cell.images = [(UIImage(named: "6"))!, (UIImage(named: "7"))!, (UIImage(named: "8"))!, (UIImage(named: "9"))!, (UIImage(named: "10"))!, (UIImage(named: "11"))!, (UIImage(named: "12"))!, (UIImage(named: "13"))!, (UIImage(named: "14"))!]
            default:
                cell.insideCollectionView .backgroundColor = .white
                cell.myCellSize = .zero
            }
             return cell
            }
            return UICollectionViewCell(frame: .zero)
    }
    
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: self.view.frame.width, height: 200)
        case 1:
            return CGSize(width: self.view.frame.width, height: 150)
        case 2:
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
                header?.titleLebel.font = UIFont.systemFont(ofSize: 20)
            case 1:
                header?.titleLebel.text = "火線話題"
            case 2:
                header?.titleLebel.text = "精選學校"
            default:
                header?.titleLebel.text = "沒有設定"
            }
            
            
            
            //test
            
           
//            header?.backgroundColor = .yellow
            header?.titleLebel.textColor = .black
           
            return header!}
            else{
            let footer  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath) as? MyFooterView
            footer?.footerTitle.text = "this is footer for section:\(indexPath.section)"
            footer?.footerTitle.textColor = .black
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
            mainCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellID")
            mainCollectionView.register(UINib(nibName: "MyCollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "CellID")
            mainCollectionView.register(UINib(nibName: "MyCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "CellID")
            mainCollectionView.register(UINib(nibName: "MyHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
            
            mainCollectionView.register(UINib(nibName: "MyFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



