//
//  FollowersTableViewController.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 02/06/21.
//

import UIKit

class FollowersTableViewController: UITableViewController {

    private let kBaseURL = "https://jsonplaceholder.typicode.com"

        private var followers = [Follower]() {
            didSet {
                tableView.reloadData()
            }
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let url = URL(string: "\(kBaseURL)/users") {
                let session = URLSession.shared

                let request = URLRequest(url: url)
                
                let task = session.dataTask(with: request) { (data, resp, error) in
                    if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                        
                        if let users = try? JSONDecoder().decode([Follower].self, from: data!) {
                            DispatchQueue.main.async {
                                self.followers = users
                            }
                        }
                    }
                }
                task.resume()
                
            }
            
            
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let identifier = segue.identifier, identifier == "onFollowerSegue" {
                print("Sender: \(sender ?? "não veio!")")
                if let followerCell = sender as? FollowerTableViewCell, let follower = followerCell.follower {
                    let albumViewController = segue.destination as! AlbumViewController
                    albumViewController.followerId = follower.id

                }
            }
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return followers.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let index = indexPath.row
            
            let follower = followers[index]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! FollowerTableViewCell
            
            cell.follower = follower
            
            return cell
            
        }
        
        override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
}
