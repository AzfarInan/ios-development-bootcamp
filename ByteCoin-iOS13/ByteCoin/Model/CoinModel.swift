//
//  CoinModel.swift
//  ByteCoin
//
//  Created by BS851 on 30/5/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let rate: String
    
    func convertRate(coinRate: Double) -> String {
        return String(format: "%.2f", coinRate)
    }
}
