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
