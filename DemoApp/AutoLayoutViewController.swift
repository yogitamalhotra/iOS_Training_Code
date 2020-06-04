//
//  AutoLayoutViewController.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 04/06/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import Foundation
import UIKit

class AutoLayoutViewController: UIViewController {
    @IBOutlet weak var userName:UILabel!
    var userText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = userText
    }
}
