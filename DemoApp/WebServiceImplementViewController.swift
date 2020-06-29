    //
    //  WebServiceImplementViewController.swift
    //  DemoApp
    //
    //  Created by Yogita.a.Malhotra on 23/06/20.
    //  Copyright © 2020 accenture. All rights reserved.
    //

    import Foundation
    import UIKit

    
    
    struct Class: Codable {
    let age: Int
    let firstname: String
    let lastname: String
    enum CodingKeys : String, CodingKey {
    case age = "age"
    case firstname = "first_name"
    case lastname = "last_name"
    }
    }
    
    class WebServiceImplementViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            let url = URL(string: "https://learnappmaking.com/ex/users.json")
            
            // Load the URL
            URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            // If there are any errors don't try to parse it, show the error
            guard let data = data, error == nil else { print(error!); return }
            let decoder = JSONDecoder()
            let classes = try! decoder.decode([Class].self, from: data)
            
                
            // Print out the classes to the console - try sticking this in a table view :)
            
            for myClass in classes {
            print(myClass.age)
            print(myClass.firstname)
            print(myClass.lastname)
            }
            }).resume()
            
            }
            }
    
    
    
        /*
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let session = URLSession.shared
            let url = URL(string: "https://learnappmaking.com/ex/users.json")!
            
            let task = session.dataTask(with: url) { (data, response, error) in
                print(data)
                print(response)
                print(error)
                
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                do {
                    let json =  try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                }catch {
                    print("Json error")
                }
            }
            task.resume()
        }
        
        @IBAction func postData() {
            let session = URLSession.shared
            let url = URL(string: "https://example.com/post")!
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
            let json = [
                "username": "zaphod42",
                "message": "So long, thanks for all the fish!"
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                print(jsonData)
                let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
                    // Do something...
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print(dataString)
                    }
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                }
                task.resume()
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
    }



    /*
     override func viewDidLoad() {
     
     let session = URLSession.shared
     let url = URL(string: "https://learnappmaking.com/ex/users.json")!
     
     let task = session.dataTask(with: url) { data, response, error in
     
     if error != nil || data == nil {
     print("Client error!")
     return
     }
     
     guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
     print("Server error!")
     return
     }
     
     guard let mime = response.mimeType, mime == "application/json" else {
     print("Wrong MIME type!")
     return
     }
     
     do {
     let json = try JSONSerialization.jsonObject(with: data!, options: [])
     print(json)
     } catch {
     print("JSON error: \(error.localizedDescription)")
     }
     
     }
     
     task.resume()
     }
     
     @IBAction func postRequest() {
     let session = URLSession.shared
     let url = URL(string: "https://example.com/post")!
     
     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
     request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
     let json = [
     "username": "zaphod42",
     "message": "So long, thanks for all the fish!"
     ]
     
     do {
     let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
     print(jsonData)
     let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
     // Do something...
     if let data = data, let dataString = String(data: data, encoding: .utf8) {
     print(dataString)
     }
     if let httpResponse = response as? HTTPURLResponse {
     print(httpResponse.statusCode)
     }
     }
     task.resume()
     
     } catch {
     print("JSON error: \(error.localizedDescription)")
     }
     }
     
     struct Class: Codable {
     let age: Int
     let firstname: String
     let lastname: String
     enum CodingKeys : String, CodingKey {
     case age = "age"
     case firstname = "first_name"
     case lastname = "last_name"
     }
     }
     
     override func viewDidLoad() {
     super.viewDidLoad()
     // Do any additional setup after loading the view, typically from a nib.
     
     let url = URL(string: "https://learnappmaking.com/ex/users.json")
     
     // Load the URL
     URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
     // If there are any errors don't try to parse it, show the error
     guard let data = data, error == nil else { print(error!); return }
     let decoder = JSONDecoder()
     let classes = try! decoder.decode([Class].self, from: data)
     
     // Print out the classes to the console - try sticking this in a table view :)
     for myClass in classes {
     print(myClass.age)
     print(myClass.firstname)
     print(myClass.lastname)
     }
     }).resume()
     
     }
     }
     
     */
*/
