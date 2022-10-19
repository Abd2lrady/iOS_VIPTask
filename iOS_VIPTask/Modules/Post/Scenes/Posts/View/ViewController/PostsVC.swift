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
    var postsInteractor: PostsInteractorProtocol!
    var router: PostsRouterProtocol!

//    =         PostsInteractor(postsPresenter: PostsPresenter(postsView: self), postsService: RemotePostsService(remoteRepository: APIClient.shared))

    
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
        
        postsTableViewDelegate.selectedPost = { [ weak self ] postIndex in
            self?.router.routeToPostDetails(postIndx: postIndex)
        }

    }
}


extension PostsVC: PostsVCProtocol {
    func showPosts(posts: [Posts.ViewModel]) {
        self.postsTableViewDelegate.posts = posts
        self.postsTV.reloadData()

    }
    
}

