//
//  DetailViewController.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/3/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class CitiesDVController: UIViewController {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    var city: CitiesData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        nameLabel.text = "\(city!.name)"
        tempLabel.text = "The temperature is \(city!.main.temp) degrees Celsius."
        weatherLabel.text = "The weather is \(city!.weather.first?.description ?? "")."
        
    }
 
}
