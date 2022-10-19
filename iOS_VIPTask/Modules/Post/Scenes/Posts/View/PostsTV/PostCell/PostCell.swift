//
//  PostCell.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    static let reuseID = "PostCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }

    
}

extension PostCell {
    
    func cellConfig(post: Posts.ViewModel) {
        userIDLabel.text = post.userID
        postTitleLabel.text = post.post
    }
    
    func clearCell() {
        userIDLabel.text = ""
        postTitleLabel.text = ""
    }
    
}
