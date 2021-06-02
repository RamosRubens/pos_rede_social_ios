//
//  FollowerTableViewCell.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 02/06/21.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {

       
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var follower: Follower? {
            didSet {
                if let follower = follower {
                    nome.text = follower.name
                    email.text = follower.email
                }
            }
        }
}
