//
//  PostTableViewCell.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 17/05/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let kreuseIdentifier = "PostTableViewCell"
    

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likePost: UILabel!
    @IBOutlet weak var sendPost: UILabel!
    @IBOutlet weak var postLikesStackView: UIStackView!
    @IBOutlet weak var postBody: UILabel!
    @IBOutlet weak var userPostLabel: UILabel!
    
    @IBAction func onLike(_ sender: UIButton){
        
    }
    
    @IBAction func onComment(_ sender: UIButton){
        
    }
    
    @IBAction func onShare(_ sender: UIButton){
        
    }
    
    @IBAction func onSave(_ sender: UIButton){
        
    }
    
    static func register(inside tableView: UITableView){
        let nib = UINib(nibName: "PostTableViewCell", bundle: Bundle(for: PostTableViewCell.self))
        tableView.register(nib, forCellReuseIdentifier: kreuseIdentifier)
    }
    
    func setup(with data: String, imagePost: UIImage, profileImage: UIImage){
//        postBody.text = data
        
        profilePictureImageView.image = profileImage
        profilePictureImageView.layer.masksToBounds = true
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        
        postImage.image = imagePost
        
    }
}
