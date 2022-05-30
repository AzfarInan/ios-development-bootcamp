//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinRate(_ coinManager: CoinManager, coinModel: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5445A5BC-D818-46C6-8A44-4F9B980C8BFA"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func fetchCoinRate(_ currency: String?) {
        let urlString = "\(baseURL)/\(currency!)?apiKey=\(apiKey)"
        print("url: \(urlString)")
        performRequest(with: urlString)
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
                    if let coinData = self.parseJson(safeData) {
                        self.delegate?.didUpdateCoinRate(self, coinModel: coinData)
                    }
                }
            }
            
            //4. Start the Task
            task.resume()
        }
    }
    
    func parseJson(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            print("rate: \(rate)")
            
            let coinModel = CoinModel(rate: String(format: "%.2f", rate))
            
            return coinModel
            
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
}

