//
//  ViewController.swift
//  SunriseSunset
//
//  Created by David on 2/17/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var solarnoonLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sharedSession = URLSession.shared

            if let url = URL(string: "https://api.sunrise-sunset.org/json?lat=51.509865&lng=-0.118092&date=today") {
                // Create Request
                let request = URLRequest(url: url)

                // Create Data Task
                let dataTask = sharedSession.dataTask(with: request, completionHandler: { [self] (data, response, error) -> Void in
                    print(data as Any)
                    
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(SunRiseModel.self, from: data!)
                       
                        DispatchQueue.main.async {
                            sunriseLabel.text = "Sunrise \n \(response.results.sunrise) "
                            print( response.results.sunrise)
                            solarnoonLabel.text = "Solar Noon \n \(response.results.solar_noon) "
                            print(response.results.solar_noon)
                            sunsetLabel.text = "Sunset \n \(response.results.sunset)"
                            print(response.results.sunset)
                        }
                        
                    } catch {
                        print(error)
                    }
                    
                })

                .resume()
            }
    }

}




