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
//    宣告gobal variable . section1ScholImage = 陣列

    
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
            var myLableNameArray:[String] = []
            
//            宣告變數UIImage陣列並命名為imageArray
            for xxx in section1ScholImage {
//                設定名為xxx的迴圈在golbal variable (section1ScholImage）中取出被塞入的圖片)
                let url = URL(string:xxx as! String)
                //            宣告url並存入String  (因為電腦不知道此處到值是否為string)
                let data = try? Data(contentsOf: url!)
                //            宣告data並將url存入
                let image: UIImage = UIImage(data: data!)!
                //            宣告image並存入data
                imageArray.append(image)
//                將image放入imageArray
                myLableNameArray.append(xxx as! String)
            }
            cell?.images = imageArray
//            將imageArray放入cell裡頭
            cell?.insideCollectionView.reloadData()
//            reloadData
            
            cell?.lableName = myLableNameArray

//
//            let navigationController = UINavigationController(rootViewController: self)
//
//            cell?.navigationController = navigationController
//
            return cell!
        }

            
        
        else if indexPath.section == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BBBB", for: indexPath) as? MyCollectionViewCell1
           
     
            
            
            cell?.myCellSize = CGSize(width: 180, height: 160)
            var imageArray: [UIImage] = []
            for image in section1ScholImage {
                let url = URL(string:image as! String)
            
                let data = try? Data(contentsOf: url!)
              
                let image: UIImage = UIImage(data: data!)!
              
                imageArray.append(image)
            }
            cell?.images = imageArray
            
//            cell?.images = [(UIImage(named: "19"))!, (UIImage(named: "21"))!, (UIImage(named: "22"))!, (UIImage(named: "20"))!]
            cell?.insideCollectionView1.reloadData()
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
            
             cell?.myTable.reloadData()
            
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
//                    宣告parsedData將data轉型為string array
                    let section1Image = parsedData["schoolImages"] as! NSArray
//                    宣告section1Image 將取出來的陣列schoolImages 轉型為NSarray
                    print(section1Image)

                    self.section1ScholImage = section1Image
//                    塞值
                    DispatchQueue.main.async {
                        self.mainCollectionView.reloadData()
                    }

                    
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

//第一行 無邊匡,header 大一點 "熱門話題"
//第幾張圖刪掉
//BACK刪除


