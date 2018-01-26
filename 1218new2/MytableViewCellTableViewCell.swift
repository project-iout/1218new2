//
//  MytableViewCellTableViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/15.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class MytableViewCellTableViewCell: UITableViewCell, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextViewDelegate{

    var postImage = UIImage()
    
    @IBOutlet var profilePhoto: UIImageView!
    @IBOutlet var userName1: UILabel!
    @IBOutlet var PostContent: UITextView!
    @IBOutlet var PostPhoto: UIImageView!
 
    var delegate:UIViewController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        PostContent.text = "在想什麼?"
        PostContent.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView?.contentMode = .scaleAspectFit
            imageView?.image = selectedImage
            PostPhoto.image = selectedImage
            delegate?.dismiss(animated: true, completion: nil)
            self.postImage = selectedImage
        }
        
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        textView.text = nil
        
    }
//
//    func setSelected(selected: Bool, animated: Bool)
//    {
//        super.setSelected(selected, animated: animated)
//    }
//

    @IBAction func postCamera(_ sender: Any) {
        print("pick image")
    let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        delegate?.present(image, animated: true
            , completion: nil)

        
//        uiimage controller  轉型成 uiimage 並丟入全域變數"PostImage"
    }

    @IBAction func PostPost(_ sender: Any) {
        let params = [
            "text": String(PostContent.text)]
        
        let image = postImage
//        使用全域變數的"PostImage" 並丟入"data"
        let data = UIImagePNGRepresentation(image)
        requestWith(imageData: data, parameters: params)
   
        delegate?.dismiss(animated: true, completion: nil)
        
    }
        func requestWith( imageData: Data?, parameters: [String : Any], onCompletion: ((JSON?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
            
    //        let url = "http://127.0.0.1:8080/api/upload/post" /* your API url */
            let url = "https://www.ioutback.com/api/upload/post" /* your API url */
            
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
                
                if let data = imageData{
                    multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
                }
                
            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
                switch result{
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print("Succesfully uploaded")
                        print(response)
                        if let err = response.error{
                            onError?(err)
                            return
                        }
                        onCompletion?(nil)
                    }
                case .failure(let error):
                    print("Error in upload: \(error.localizedDescription)")
                    onError?(error)
            }
        }
    
    }
    
}
    



