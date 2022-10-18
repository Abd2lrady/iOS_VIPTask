//
//  ViewController.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var postsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        APIClient.shared.request(for: .getPosts) { result in
        //            print(result)
        
        RemotePostsService().getPosts { result in
            switch result {
            case .success(let res):
                print(res.data.count)
            case .failure:
                print("error")
            }
        }
    }
}


