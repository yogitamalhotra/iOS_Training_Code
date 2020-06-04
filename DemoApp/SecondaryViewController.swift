//
//  SecondaryViewController.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 04/06/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import Foundation
import UIKit

class SecondaryViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = text
    }
}
