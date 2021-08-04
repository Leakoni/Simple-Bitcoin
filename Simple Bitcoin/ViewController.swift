//
//  ViewController.swift
//  Simple Bitcoin
//
//  Created by Dovydas Bumblauskas on 2021-08-04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btcLabel: UILabel!
    @IBOutlet var updateBtn: UIButton!
    @IBOutlet var lastTime: UILabel!
    
    var url = "https://api.coincap.io/v2/rates/bitcoin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jss()
    }

    
    func jss(){
        if let url = URL(string: url) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {

                    let btc = try! Welcome(jsonString)
                    
                    DispatchQueue.main.async {
                        let btcText = "\(Float(btc.data.rateUsd)!.clean)\(btc.data.currencySymbol)"
                        self.btcLabel.text = btcText
                        self.lastTime.text = "\(self.timeConv(timeStamp: (Double(btc.timestamp) / 1000) ))"
                    }
                    
                 }
               }
           }.resume()
        }
    }
    
    func timeConv(timeStamp : Double) -> String {

            let date = NSDate(timeIntervalSince1970: timeStamp)

            let dayTimePeriodFormatter = DateFormatter()
            dayTimePeriodFormatter.dateFormat = "MMM dd YY, HH:mm:ss"

            let dateString = dayTimePeriodFormatter.string(from: date as Date)
            return dateString
        }
    
    @IBAction func update(_ sender: Any) {jss()}
    
}

