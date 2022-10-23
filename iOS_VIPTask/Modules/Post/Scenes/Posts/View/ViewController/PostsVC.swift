//
//  ViewController.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var _postsTV: UITableView!
    
    let postsTableViewDelegate = PostsTVDelegate()
    var postsInteractor: PostsInteractorProtocol?
    var router: PostsRouterProtocol?

//    =         PostsInteractor(postsPresenter: PostsPresenter(postsView: self), postsService: RemotePostsService(remoteRepository: APIClient.shared))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configPostsTV()
        
        postsInteractor?.getPosts(request: Posts.Request())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _postsTV.reloadData()
    }
    
    func configPostsTV() {
        
        _postsTV.delegate = self.postsTableViewDelegate
        _postsTV.dataSource = self.postsTableViewDelegate
        
        let cellNib = UINib(nibName: "\(PostCell.self)",
                            bundle: .main)
        
        _postsTV.register(cellNib,
                         forCellReuseIdentifier: PostCell.reuseID)
        postsTableViewDelegate.selectedPost = { [ weak self ] postID in
            self?.router?.routeToPostDetails(postID: postID)
        }

    }
}


extension PostsVC: PostsVCProtocol {
    func showPosts(posts: [Posts.ViewModel]) {
        self.postsTableViewDelegate.posts = posts
        self._postsTV.reloadData()

    }
    
    var postsTV: UITableView {
        get {
            return _postsTV
        } set {
            _postsTV = newValue
        }
    }
    
}

