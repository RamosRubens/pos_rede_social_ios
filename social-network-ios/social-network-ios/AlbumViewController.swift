//
//  AlbumViewController.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 04/06/21.
//

import UIKit

class AlbumViewController: UIViewController {
    
    @IBOutlet weak var albumTableView: UITableView!
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    var followerId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTablewView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAlbum()
    }
    
    private var albums = [Album]() {
        didSet {
            albumTableView.reloadData()
        }
    }
    
    private func setupTablewView() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
        self.albumTableView.rowHeight = UITableView.automaticDimension
    }
    
    
    fileprivate func loadAlbum() {
        if let url = URL(string: "\(kBaseURL)/users/\(followerId)/albums") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request) { (data, resp, error) in
                if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                    if let followers = try? JSONDecoder().decode([Album].self, from: data!) {
                        DispatchQueue.main.async {
                            self.albums = followers
                        }
                    }
                }
            }
            task.resume()
        }
    }

}

extension AlbumViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumTableCell", for: indexPath) as! AlbumTableViewCell
        
        let index = indexPath.row
        let album = albums[index]
        
        cell.albumTitle.text = "Album:"
        cell.albumName.text = album.title
        
        cell.collectionAlbum.delegate = self
        cell.collectionAlbum.dataSource = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 250
       }
}


extension AlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCollection", for: indexPath) as! AlbumCollectionViewCell
              
        cellCollection.setup(image: UIImage(named: "noImage")!)
        return cellCollection
    }
}
    
