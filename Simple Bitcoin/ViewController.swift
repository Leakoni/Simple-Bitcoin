//
//  ViewController.swift
//  Simple Bitcoin
//
//  Created by Dovydas Bumblauskas on 2021-08-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var testing: UITextView!
    
    var url = "https://api.coincap.io/v2/rates/bitcoin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAPI()
    }
    
    func loadAPI(){
        if let url = URL(string: url) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {

                    let btc = try! Welcome(jsonString)
                    
                    DispatchQueue.main.async {
                        self.testing.text = "\(Float(btc.data.rateUsd)!.clean) \(btc.data.currencySymbol)"
                    }

                    
                 }
               }
           }.resume()
        }
    }

}

