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
    @IBOutlet var myLable11: UILabel!
       @IBOutlet var myButton11: UIButton!

    @IBOutlet weak var passDataButton: UIButton!
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
    @IBAction func myButtonClicked111111(_ sender: UIButton) {
           print(sender.classForCoder)
           print(sender.superclass as Any)
           myButton.setTitle("New button", for: UIControl.State.normal)
           let alertController = UIAlertController(title: "Welcome to My First app", message: "Hello world", preferredStyle: UIAlertController.Style.alert)
           
           alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           present(alertController, animated: true, completion: nil)
       }

    @IBAction func passDataOnClick(_ sender: Any) {
        let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
        vc.text = "Ashok"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      /*  if segue.destination is AutoLayoutViewController {
            let vc = segue.destination as? AutoLayoutViewController
            vc?.userText = "Yogita Malhotra"
        }
 */
     /*   if let vc = segue.destination as? AutoLayoutViewController {
                   vc.userText = "Yogita Malhotra"
               }
 */
        if segue.identifier == "autoLayout" {
            let vc = segue.destination as? AutoLayoutViewController
                       vc?.userText = "Yogita Malhotra"
        }
    }
}

