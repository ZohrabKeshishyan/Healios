//
//  PostDetailsViewController.swift
//  Healios
//
//  Created by Zohrab Keshishyan on 25.08.21.
//

import UIKit

class PostDetailsViewController: BaseViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var profileView: ProfileView!
    @IBOutlet var companyView: CompanyView!
    @IBOutlet var postContentView: UIView!
    @IBOutlet var commentContentView: UIView!
    @IBOutlet var postTitleLabel: UILabel!
    @IBOutlet var postSubTitleLabel: UILabel!
    
    var post: PostModel!
    private var comments: [CommentModel] {
       let comments = RealmDataBase.shered.fetchAllObjectsAt(CommentModel.self).filter { comment in
            return comment.postId == post.id
        }
        commentContentView.isHidden = comments.isEmpty
        return comments
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        postTitleLabel.text = post.title
        postSubTitleLabel.text = post.body
        fetchDataSource()
        fetchComments()
    }
    
    func fetchDataSource() {
        postContentView.isHidden = true
        self.updateUI()
        BackendRequest.shared.fetchUsers{ succes in
            self.updateUI()
        } error: { error, code in
            
        }
    }
    
    func fetchComments() {
        BackendRequest.shared.fetchComments{ succes in
            self.tableView.reloadData()
        } error: { error, code in
            
        }
    }
    
    func updateUI() {
        let userModels = RealmDataBase.shered.fetchAllObjectsAt(UserModel.self).filter { model in
            return model.id == post.userId
        }
        
        guard let user = userModels.first else{
            return
        }
        postContentView.isHidden = false
        profileView.configure(user: user)
        guard let company = user.company else{
            return
        }
        companyView.configure(company: company)
        
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate

extension PostDetailsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier) as! CommentTableViewCell
        cell.configure(comment: comments[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}
