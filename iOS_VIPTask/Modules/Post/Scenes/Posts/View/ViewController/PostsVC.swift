//
//  ViewController.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var postsTV: UITableView!
    
    let postsTableViewDelegate = PostsTVDelegate()
    lazy var postsInteractor: PostsInteractorProtocol! =         PostsInteractor(postsPresenter: PostsPresenter(postsView: self), postsService: RemotePostsService(remoteRepository: APIClient.shared))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configPostsTV()
        
        postsInteractor.getPosts(request: Posts.Request())
    }
    
    func configPostsTV() {
        
        postsTV.delegate = self.postsTableViewDelegate
        postsTV.dataSource = self.postsTableViewDelegate
        
        let cellNib = UINib(nibName: "\(PostCell.self)",
                            bundle: .main)
        
        postsTV.register(cellNib,
                         forCellReuseIdentifier: PostCell.reuseID)
    }

}


extension PostsVC: PostsVCProtocol {
    func showPosts(posts: [Posts.ViewModel]) {
        self.postsTableViewDelegate.posts = posts
        self.postsTV.reloadData()

    }
    
}

