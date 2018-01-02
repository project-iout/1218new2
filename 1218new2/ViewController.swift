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
    var section1Image = [String]()
    var globalImage:UIImage? = nil
    var section1ScholImage:NSArray = []

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func get_image(_ url_str:String) -> UIImage {
        var image: UIImage?
    //宣告一個變數叫做image，然後初始化一個UIImage物件 放到變數image裡面
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
//     data是區域變數 只能活在dataTask方法裡面
            if data != nil
            {
                image = UIImage(data: data!)!
                //            宣告一個變數data,初始化一個image物件
                //把data改成image之後丟掉
            }
        })
        task.resume()
        return image!
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AAAB", for: indexPath) as? MyCollectionViewCell
                cell?.myCellSize = CGSize(width: 265, height: 180)
            
            var imageArray: [UIImage] = []
            for image in section1ScholImage {
                let url = URL(string:image as! String)
                //            1.訪問網址 根據indexPath.item 取出圖片網址
                let data = try? Data(contentsOf: url!)
                //            2.訪問取得data
                let image: UIImage = UIImage(data: data!)!
                //            3.將data轉成UIImage
                imageArray.append(image)
            }
            cell?.images = imageArray
      
            return cell!
//            self.section1ScholImage = section1Image
     
        
            
       
            
        }
        else if indexPath.section == 1 {
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
    



        else if indexPath.section == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QQQ", for: indexPath) as? MyCollectionViewCell3
         
//            var restaurantName = ["SPAO", "Campus", "Ali", "QB", "AVOS"]
//            cell?.words = ["SPAO", "Campus", "Ali", "QB", "AVOS"]
            return cell!
        }
        
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RRR", for: indexPath) as?MyCollectionViewCell4
            
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
        case  4:
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
                header?.titleLebel.text = "超值商品"
            case 4:
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
                footer?.footerTitle.text = "商品內容"
            case 4:
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = indexPath.section
        let item = indexPath.item
        print("you select section \(section), item = \(item)")
        
    
 
    }
    
    func initialImages(){
        let urlString = "https://www.ioutback.com/api/pics/hottest"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    
                    let section1Image = parsedData["schoolImages"] as! NSArray
                    
                    print(section1Image)
                    
                    self.section1ScholImage = section1Image
                    self.mainCollectionView.reloadData()
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    
    @IBOutlet var mainCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialImages()
       
 
        
    //Retrive the data from this link
//        let urlString = "https://www.ioutback.com/api/pics/hottest"
//        let url = URL(string: urlString)
//        // url -> task
//        URLSession.shared.dataTask(with:url!) { (data, response, error) in
//        //判斷error.   data means downloaded data
//            if error != nil {
//                print(error as Any)
//            } else{
//                do {
//
//                   // 用JSONSerialization轉成Dictionary 來抓到的Json String
//                    //亦可,先做Dictionary再用JSONSerialization轉成Json String。
//                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
//
//                    let section1Image = parsedData["schoolImages"] as! NSArray
//
//                    self.section1ScholImage = section1Image
//
//
////                    print(section1Image as Any)
//
////                    let section1Image = parsedData["schoolImages"] as! NSArray
////
////                    print(section1Image[0])
//
//
//                } catch let error as NSError {
//                    print(error)
//                }
//            }
//
//            }.resume()

        
        
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
                UINib(nibName: "MyCollectionViewCell3", bundle: nil),
                forCellWithReuseIdentifier: "QQQ"
            )
           mainCollectionView.register(
                UINib(nibName: "MyCollectionViewCell4", bundle: nil),
                forCellWithReuseIdentifier: "RRR")
                
                
                
            mainCollectionView.register(
                UINib(nibName: "MyHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
            
            mainCollectionView.register(UINib(nibName: "MyFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        }
        struct schoolImages {
            let imageUrl: String
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




