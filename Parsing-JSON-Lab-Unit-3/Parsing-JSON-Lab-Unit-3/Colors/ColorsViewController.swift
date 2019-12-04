//
//  ColorsViewController.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/3/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Details]() {
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
        colors = ColorsData.getColors()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorsDVController = segue.destination as? ColorsDVController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to access Colors Detail View controller")
        }
        let colorAtIndexPath = colors[indexPath.row]
        colorsDVController.color = colorAtIndexPath
    }
    

}

extension ColorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
     
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(red: (CGFloat(color.rgb.rValue)/CGFloat(255)), green: (CGFloat(color.rgb.gValue)/CGFloat(255)), blue: (CGFloat(color.rgb.bValue)/CGFloat(255)), alpha: 1)

        
        return cell
    }
}
