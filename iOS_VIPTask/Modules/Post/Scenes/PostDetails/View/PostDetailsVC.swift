//
//  PostDetailsVC.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import UIKit

class PostDetailsVC: UIViewController {

    @IBOutlet weak var postIDLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    var postDetailsInteractor: PostDetailsInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postDetailsInteractor?.getPostDetails(request: PostDetails.Request())
        // Do any additional setup after loading the view.
    }
    


}

protocol PostDetailsVCProtocol: AnyObject {
    func showPostDetails(post: PostDetails.ViewModel)
}

extension PostDetailsVC: PostDetailsVCProtocol {
    
    func showPostDetails(post: PostDetails.ViewModel) {
        postIDLabel.text = post.postID
        postTitleLabel.text = post.postTilte
        postLabel.text = post.post
    }
}
