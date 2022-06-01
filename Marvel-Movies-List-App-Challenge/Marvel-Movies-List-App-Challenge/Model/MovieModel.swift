//
//  MovieModel.swift
//  Marvel-Movies-List-App-Challenge
//
//  Created by BS851 on 30/5/22.
//

import Foundation

struct MovieModel: Codable {
    let results: [MovieDetailsData]
    let total_results: Int
}

struct MovieDetailsData: Codable {
    let original_title: String
    let overview: String
    let poster_path: String
}
