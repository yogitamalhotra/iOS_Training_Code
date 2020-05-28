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
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLable.text = "Lable Text 1"
    }
    @IBAction func myButtonClicked(_ sender: UIButton) {
        print(sender.classForCoder)
        print(sender.superclass as Any)
        myButton.setTitle("New button", for: UIControl.State.normal)
        let alertController = UIAlertController(title: "Welcome to My First app", message: "Hello world", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

