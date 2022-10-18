//
//  PostsTVDelegate.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

class PostsTVDelegate: NSObject {
    var posts = [PostEntity]()
}

extension PostsTVDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension PostsTVDelegate: UITableViewDelegate {
    
}
