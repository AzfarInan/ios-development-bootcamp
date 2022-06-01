//
//  MovieManager.swift
//  Marvel-Movies-List-App-Challenge
//
//  Created by BS851 on 30/5/22.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovieList(_ movieManager: MovieManager, movieData: [MovieData])
    func didFailWithError(_ error: Error)
}

struct MovieManager {
    
    let baseURL = "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel"
    
    var delegate: MovieManagerDelegate?
        
    func fetchMovieList() {
        performRequest(with: baseURL)
    }
    
    func performRequest(with urlString: String){
        // 1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give Session a Task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let movieListData = self.parseJson(safeData) {
                        self.delegate?.didUpdateMovieList(self, movieData: movieListData)
                    }
                }
            }
            
            //4. Start the Task
            task.resume()
        }
    }
    
    func parseJson(_ movieData: Data) -> [MovieData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieModel.self, from: movieData)
            
            var movieDataList = [MovieData]()
            
            for resultObjects in decodedData.results {
                movieDataList.append(MovieData(title: resultObjects.original_title, detail: resultObjects.overview, image: resultObjects.poster_path))
            }
//            print(movieDataList)
            return movieDataList
            
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
}

