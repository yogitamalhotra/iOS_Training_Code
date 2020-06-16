//
//  ResturantCollectionView.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 16/06/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import Foundation
import UIKit

class ResturantCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
           super.viewDidLoad()

       }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 100
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifer", for: indexPath) as UICollectionViewCell
        cell.backgroundColor = randomColor()
        return cell
       }
       
    // custom function to generate a random UIColor
       func randomColor() -> UIColor{
           let red = CGFloat(drand48())
           let green = CGFloat(drand48())
           let blue = CGFloat(drand48())
           return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
       }
    
    //UICollectionViewDelegateFlowLayout methods
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
     {
         
         return 14;
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
     {
         
         return 20;
     }
     
}
