//
//  MytableViewCellTableViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/15.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit
class MytableViewCellTableViewCell: UITableViewCell, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextViewDelegate{

    @IBOutlet var profilePhoto: UIImageView!
    @IBOutlet var userName1: UILabel!
    @IBOutlet var PostContent: UITextView!

    @IBOutlet var PostPhoto: UIImageView!
    
 
    
    var delegate:UIViewController?

    @IBAction func postCamera(_ sender: Any) {
        print("pick image")
    let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        delegate?.present(image, animated: true
            , completion: nil)
    }
   
    @IBAction func PostPost(_ sender: Any) {
      
        
        print("post post")
        
        let textString = PostContent.text
        let url = URL(string: "https://www.ioutback.com/api/upload/post" )
        var request = URLRequest(url: url!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "text=" + String(describing: textString)
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            print("dismiss this controller")
            if let delegate = self.delegate {
                print("Back to whole post")
                DispatchQueue.main.async {
                    delegate.dismiss(animated: true, completion: nil)
                }
                
                
                
            }
            
        }
        task.resume()
        
    }
    
    
    
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            PostPhoto.image = image
            delegate?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        PostContent.text = "在想什麼?"
        PostContent.delegate = self
       
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        //
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
