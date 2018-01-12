//
//  Post.swift
//  Facebook+Research
//
//  Created by Duc Tran on 3/20/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

struct Post
{
    var createdBy: User?
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?

}

struct User
{
    var username: String?
    var profileImage: UIImage?
}


