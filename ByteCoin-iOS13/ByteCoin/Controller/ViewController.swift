//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var pickerLabel: UILabel!
    @IBOutlet weak var pickerViewControl: UIPickerView!
    
    var coinManager = CoinManager()
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        
        pickerViewControl.delegate = self
        pickerViewControl.dataSource = self
        
        pickerData = coinManager.currencyArray
        pickerLabel.text = pickerData[0]
        coinManager.fetchCoinRate(pickerData[0])
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func didUpdateCoinRate(_ coinManager: CoinManager, coinModel: CoinModel) {
        DispatchQueue.main.async {
            self.rateLabel.text = coinModel.rate
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController : UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
}

//MARK: - UIPickerViewDelegate

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = pickerData[row]
        coinManager.fetchCoinRate(pickerLabel.text)
        self.view.endEditing(true)
    }
}
