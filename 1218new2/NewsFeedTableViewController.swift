////
//  NewsfeedTableViewController.swift
//  Facebook+Research
//
//  Created by Duc Tran on 3/24/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class NewsfeedTableViewController : UITableViewController
{
    
    var pageNumber: Int = 1
    var searchController: UISearchController!
    var posts: [Post]?
//    宣告一個叫做posts 的array變數
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.fetchPosts()
//        先執行這兩個方法
        tableView.separatorStyle = .none
        // dynamic table view cell height
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func fetchPosts()
    {
//        宣告一個變數字串陣列名為 results
        let urlString = "https://www.ioutback.com/api/wall/top20"
//        宣告一個常數字串名為urlString
        let url = URL(string: urlString)
//        宣告一個url 並存入網址string
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do{
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    
//                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! String
//                    宣告parsedData將data轉型為string array
                    
                    let results = parsedData["wall"] as! NSArray
                    
//                    宣告postArray 將取出來的陣列wall 轉型為NSarray 塞值
                    self.dataFetched(results)
                } catch let error as NSError {
                    print(error)
                }
            }
            }.resume()
    }
    func dataFetched(_ results:NSArray){
        var posts = [Post]()
//        宣告一個名稱為posts的變數 並塞入post陣列架構, () 代表這個post可以是任意的數量
        for item in results{
//            從results這個陣列裡取出item
            var newPost = Post()
            
            let dicItem = item as! NSDictionary
            newPost.caption = dicItem["text"] as! String
//            宣告一個名為newPost的Post物件,這個物件會以我在post.swift宣告的struct為基本架構 根據輸入的值而改變其內容
//            newPost.caption = item
//            將取得的item存在名為newPost的Post物件
            newPost.numberOfComments = 2000
            newPost.numberOfLikes = 1
            newPost.numberOfShares = 5
            newPost.image = UIImage(named: "8")
            posts.append(newPost)
        }
        
        self.posts = posts
//        將local var 的post 丟回gobal var 的post
        DispatchQueue.main.async {
//          將畫面變動交給主要執行緒
            self.tableView.reloadData()
//            重新run下面的方法
        }
        
    }
    func setupSearchController()
    {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.barStyle = .black
        
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
}

// MARK: - UITableViewDataSource

extension NewsfeedTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else {
            return 0
        }
    }
  
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.post = self.posts?[indexPath.row]
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem: Int = (posts?.count)!
        
        print(String("我想知道indexPath.row = " + String(indexPath.row)))
        print("我想知道lastItem value = " + String(describing: lastItem))
        
        if indexPath.row == lastItem - 2
        {
   
            
            loadMoreData(pageNumber)
            pageNumber = pageNumber+1
            
            //            tableView.reloadData()
        }
       
    }
    
    func loadMoreData(_ pageNumber: Int ){
        var results1:[String]?
        let urlString = "https://www.ioutback.com/api/wall/more/" + String(pageNumber)
        let url = URL(string: urlString)
        //        宣告一個url 並存入網址string
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do{
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    //                    宣告parsedData將data轉型為string array
                    results1 = (parsedData["wall"] as! [String])
                    //                宣告postArray 將取出來的陣列wall 轉型為NSarray
                    if results1![0] != "stop"{
//                    when result1 is not equal to [0], than execute the command below, if equal, break the loop
                        self.dataFetched1(results1!)
                    }
                    else {
                        print("This is the end!")
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            print("test0000000")
            }.resume()
    }
    
    

    func dataFetched1(_ results1:[String]){
        print("testt11111")

        for item1 in results1{
            print("testt222222")
            //            從results這個陣列裡取出item
            var newPost = Post()
            //            宣告一個名為newPost的Post物件,這個物件會以我在post.swift宣告的struct為基本架構 根據輸入的值而改變其內容
            newPost.caption = item1
            //            將取得的item存在名為newPost的Post物件
            newPost.numberOfComments = 2000
            newPost.numberOfLikes = 1
            newPost.numberOfShares = 5
            newPost.image = UIImage(named: "2")
//            posts.append(newPost)
            self.posts?.append(newPost)
        }
        
        
        //        將local var 的post 丟回gobal var 的post
        DispatchQueue.main.async {
            //          將畫面變動交給主要執行緒
            self.tableView.reloadData()
            //            重新run下面的方法
        }
        
    }
    
    
    
    
}

    
    
     
