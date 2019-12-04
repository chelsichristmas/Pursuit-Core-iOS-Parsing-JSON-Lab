//
//  ColorsDVController.swift
//  Parsing-JSON-Lab-Unit-3
//
//  Created by Chelsi Christmas on 12/3/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import UIKit

class ColorsDVController: UIViewController {
    
    var color: Details?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    @IBOutlet weak var RGBLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
   func updateUI() {
    
    nameLabel.text = "\(color!.name.value)"
    hexLabel.text = "Hex Value:  \(color!.hex.value)"
    RGBLabel.text = "R Value: \(color!.rgb.rValue), G Value: \(color!.rgb.gValue), B Value: \(color!.rgb.bValue)"
    }


}
