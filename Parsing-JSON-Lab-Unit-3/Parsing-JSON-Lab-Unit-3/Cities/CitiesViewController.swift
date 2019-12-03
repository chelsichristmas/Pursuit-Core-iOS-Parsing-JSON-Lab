//
//  ViewController.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 11/27/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weather = [CitiesData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
       
    }
    func loadData() {
        weather = AllWeatherConditions.getWeatherConditions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? CitiesDVController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError ("Unable to access Detail View Controller")}
        let weatherAtIndexPath = weather[indexPath.row]
        detailViewController.city = weatherAtIndexPath
    }


}
extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        let city = weather[indexPath.row]
        
        cell.textLabel?.text = city.name
        
       return cell
    }
}

