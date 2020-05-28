//
//  ViewController.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 22/05/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLable: UILabel!
    
    @IBOutlet var myLabel1: UILabel!
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLable.text = "Changed Text"
        myLabel1.text = "Changed Text Label 2"

    }

    @IBAction func myButtonClicked(_ sender: UIButton) {
        print(sender.classForCoder)
        print(sender.superclass)
        
        myButton.setTitle("New button", for: UIControl.State.normal)
        
    }

}

