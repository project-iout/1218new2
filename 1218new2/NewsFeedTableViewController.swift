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
    var refresh = UIRefreshControl()
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
        
       
        refresh.tintColor = UIColor.blue
        refresh.attributedTitle = NSAttributedString()
        
        refresh.addTarget(self, action:  #selector(self.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        self.tableView.addSubview(self.refresh)
     
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
    
        self.tableView.reloadData()
        refreshControl.endRefreshing()
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
                    self.dataFetched(results , loadMoreflag: "firstTimeLoad")
                } catch let error as NSError {
                    print(error)
                }
            }
            }.resume()
            }
    func dataFetched(_ results:NSArray , loadMoreflag:String){
        var posts = [Post]()
//        宣告一個名稱為posts的變數 並塞入post陣列架構, () 代表這個post可以是任意的數量
        for item in results{
//            從results這個陣列裡取出item
            var newPost = Post()
            
            let dicItem = item as! NSDictionary
            newPost.caption = dicItem["text"] as! String
            let url = URL(string: dicItem["image"] as! String)
            if url != nil{
                let data = try? Data(contentsOf: url!)
                let image: UIImage = UIImage(data: data!)!
            newPost.image = image
            
            }
         
            newPost.numberOfComments = 2000
            newPost.numberOfLikes = 1
            newPost.numberOfShares = 5
            
           
            posts.append(newPost)
            
            if (loadMoreflag == "secondTimeLoad"){
                self.posts?.append(newPost)
            }
        
        }
        
        if (loadMoreflag == "firstTimeLoad"){
            self.posts = posts
        }
        
        
        DispatchQueue.main.async {

            self.tableView.reloadData()
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

    extension NewsfeedTableViewController{
        
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
        }
        else{
            fetchPosts()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.refreshControl?.endRefreshing()
//        return posts?.count
        refresh.endRefreshing()
        }
        
        
     func populate()
        {
         loadMoreData(pageNumber)
           
        }
    func loadMoreData(_ pageNumber: Int ){
        let urlString = "https://www.ioutback.com/api/wall/more/" + String(pageNumber)
        let url = URL(string: urlString)
        //        宣告一個url 並存入網址string
        URLSession.shared.dataTask(with: url!){(data, response, error) in
        if error != nil {
                print(error as Any)
            }
        else {
            do{
                let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
//                    宣告parsedData將data轉型為string array
                let results1 = parsedData["wall"] as! NSArray
//                宣告postArray 將取出來的陣列wall 轉型為NSarray
                let dicItem = results1[0] as! NSDictionary
                if (dicItem["status"] as! String != "stop" ){
//                  這兩行表示 如果array中第一筆元素 有一個key 叫做status, value叫做 stop 則執行下一行
//                    when result1 is not equal to [0], than execute the command below, if equal, break the
                self.dataFetched(results1 , loadMoreflag: "secondTimeLoad")
        }
                    
                else {
                    
                print("This is the end!")
        }
                    
        } catch let error as NSError {
                print(error)
        }
        }
                print("test0000000")
        }
            .resume()
        refreshControl?.endRefreshing()
          tableView.reloadData()
        }
        }



    
     
