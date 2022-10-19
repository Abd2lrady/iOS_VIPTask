//
//  PostsTVDelegate.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

class PostsTVDelegate: NSObject {
    var posts = [Posts.ViewModel]()
    var selectedPost: ((Int) -> Void)?
}

extension PostsTVDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID,
                                                 for: indexPath) as? PostCell
        else { fatalError("can`t dequeue post cell") }
        
        cell.cellConfig(post: posts[indexPath.row])
        
        return cell
    }
    
    
}

extension PostsTVDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        selectedPost?(indexPath.row)
    }
}
