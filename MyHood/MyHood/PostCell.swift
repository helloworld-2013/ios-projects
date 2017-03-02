//
//  PostCell.swift
//  MyHood
//
//  Created by Indra Gunawan on 1/3/17.
//  Copyright © 2017 MyLab Inc. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        postImg.layer.cornerRadius = 15.0
        postImg.clipsToBounds = true
    }
    
    func configure(post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.desc
        postImg.image = DataService.instance.imageFromPath(path: post.imagePath)
    }

}
