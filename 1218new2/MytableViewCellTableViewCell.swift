//
//  MytableViewCellTableViewCell.swift
//  1218new2
//
//  Created by Yu-Liang Chou  on 2018/1/15.
//  Copyright © 2018年 aa. All rights reserved.
//

import UIKit

class MytableViewCellTableViewCell: UITableViewCell {

    @IBOutlet var profilePhoto: UIImageView!
    @IBOutlet var userName1: UILabel!
    
    @IBOutlet var PostContent: UILabel!
    
    @IBOutlet var postCell1: UIView!
    
    @IBOutlet var postCell2: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
