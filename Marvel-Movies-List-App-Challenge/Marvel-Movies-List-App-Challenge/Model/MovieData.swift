//
//  MovieData.swift
//  Marvel-Movies-List-App-Challenge
//
//  Created by BS851 on 30/5/22.
//

import Foundation
import UIKit

struct MovieData {
    let title: String
    let detail: String
    let image: String
    
    var getImageURL: String {
        let urlFirstPart = "https://image.tmdb.org/t/p/w500"
        return urlFirstPart + image
    }
}

