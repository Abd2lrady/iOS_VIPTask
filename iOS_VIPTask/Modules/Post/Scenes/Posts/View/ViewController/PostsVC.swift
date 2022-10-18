//
//  ViewController.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var postsTV: UITableView!
    
    let PostsTableViewDelegate = PostsTVDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        APIClient.shared.request(for: .getPosts) { result in
        //            print(result)
        
        configPostsTV()
        
        RemotePostsService().getPosts { [unowned self] result in
            switch result {
            case .success(let res):
                let postsVM = res.data.map { post in
                    Post.ViewModel(userID: "UserID: \(String(post.userID))",
                                   post: post.title)
                }
                self.PostsTableViewDelegate.posts = postsVM
                self.postsTV.reloadData()
                
            case .failure:
                print("error")
            }
        }
        
    }
}


extension PostsVC {
    func configPostsTV() {
        
        postsTV.delegate = self.PostsTableViewDelegate
        postsTV.dataSource = self.PostsTableViewDelegate
        
        let cellNib = UINib(nibName: "\(PostCell.self)",
                            bundle: .main)
        
        postsTV.register(cellNib,
                         forCellReuseIdentifier: PostCell.reuseID)
    }
    

}
