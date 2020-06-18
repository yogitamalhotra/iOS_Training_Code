//
//  DataPersistanceViewController.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 17/06/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import CoreData

struct Preferences: Codable {
    var webserviceURL:String
    var itemsPerPage:Int
    var backupEnabled:Bool
}
class DataPersistanceViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTxtFld: UITextField!
    
    @IBOutlet weak var emailtxtfld: UITextField!
    
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var saveBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
               let context = appDelegate.persistentContainer.viewContext
               
               let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
               let newUser = NSManagedObject(entity: entity!, insertInto: context)
               
               
               newUser.setValue("Shashikant", forKey: "username")
               newUser.setValue("1234", forKey: "password")
               newUser.setValue("12", forKey: "age")
               
               do {
                   
                   try context.save()
                   
               } catch {
                   
                   print("Failed saving")
               }
               
               let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
               //request.predicate = NSPredicate(format: "age = %@", "12")
               request.returnsObjectsAsFaults = false

               do {
                   let result = try context.fetch(request)
                   for data in result as! [NSManagedObject] {
                      print(data.value(forKey: "username") as! String)
                   }
                   
               } catch {
                   
                   print("Failed")
               }


        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    @IBAction func saveBtnClicked(_ sender: Any) {
        if let name = nameTxtFld.text {
            UserDefaults.standard.setValue(name, forKey: "name")
        }
        if let email = emailtxtfld.text {
            UserDefaults.standard.setValue(email, forKey: "email")
        }
    }
    
    @IBAction func savePasswordTokeychaiACTION(_ sender: Any) {
        if let password = passwordTxtFld.text {

        let saveSuccessful: Bool = KeychainWrapper.standard.set(password, forKey: "userPassword")
            print("Save was successful: \(saveSuccessful)")
            self.view.endEditing(true)

        }
    }
    @IBAction func retriveJUserDefaultDataAction(_ sender: Any) {
        if let name =  UserDefaults.standard.value(forKey: "name"){
            print(name)
        }
        if let email =  UserDefaults.standard.value(forKey: "email") {
            print(email)
        }
        if let retrievedPassword = KeychainWrapper.standard.string(forKey: "userPassword") {
            print("Retrieved passwork is: \(retrievedPassword)")

        }
    }
    @IBAction func getFruitPlist(_ sender: Any) {
        if let fruits = getPlist(withName: "Fruits") {
            print(fruits)
        }
    }
    func getPlist(withName name: String) -> [String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }

        return nil
    }
    @IBAction func getCodablePlistData(_ sender: Any) {
        if  let path        = Bundle.main.path(forResource: "Preferences", ofType: "plist"),let xml         = FileManager.default.contents(atPath: path), let preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml)
        {
            print(preferences.backupEnabled)
            print(preferences.webserviceURL)

        }
    }
    
    @IBAction func WritingDataToPlist(_ sender: Any) {
        let preferences = Preferences(webserviceURL: "https://api.twitter.com", itemsPerPage: 10, backupEnabled: false)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Preferences.plist")

        do {
            let data = try encoder.encode(preferences)
            try data.write(to: path)
        } catch {
            print(error)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
