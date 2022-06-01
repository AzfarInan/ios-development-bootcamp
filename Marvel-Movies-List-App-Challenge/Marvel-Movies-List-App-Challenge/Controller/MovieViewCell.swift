//
//  TableViewCell.swift
//  Marvel-Movies-List-App-Challenge
//
//  Created by BS851 on 30/5/22.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var detailView: UILabel!
    
    func setMovie(movie: MovieData) {
        titleView.text = movie.title
        detailView.text = movie.detail
        
        detailView.lineBreakMode = .byWordWrapping
        detailView.numberOfLines = 0
        
        titleView.lineBreakMode = .byWordWrapping
        titleView.numberOfLines = 0
        
        load(url: URL(string: movie.getImageURL)!)
    }
    
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }
        }
    }
    
    
}
