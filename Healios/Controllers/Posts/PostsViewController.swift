//
//  PostsViewController.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import UIKit
import Realm

class PostsViewController: BaseViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Private Proprties
    
    private var posts: [PostModel] {
        RealmDataBase.shered.fetchAllObjectsAt(PostModel.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fetchDataSource()
    }
    
    func fetchDataSource() {
        BackendRequest.shared.fetchPosts { succes in
            self.tableView.reloadData()
        } error: { error, code in
            
        }
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate

extension PostsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
        cell.selectionStyle = .none
        cell.configure(post: posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Controllers.postDetails()
        vc.post = posts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
