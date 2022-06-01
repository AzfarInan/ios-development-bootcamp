//
//  MovieListScreen.swift
//  Marvel-Movies-List-App-Challenge
//
//  Created by BS851 on 30/5/22.
//

import UIKit

class MovieListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieManager = MovieManager()
    
    var movieDataList = [MovieData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        movieManager.delegate = self
        
        movieManager.fetchMovieList()
//        movieManager.fetchMovieList()
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MovieListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movieDataList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieViewCell
        
        cell.setMovie(movie: movie)
        return cell
    }
}

//MARK: - MovieManagerDelegate

extension MovieListScreen : MovieManagerDelegate {
    
    func didUpdateMovieList(_ movieManager: MovieManager, movieData: [MovieData]) {
        print("Calling")
        self.movieDataList = movieData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
