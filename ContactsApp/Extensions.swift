//
//  Extensions.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithVisualFormat(format: String, views: UIView...) {
        
        var viewDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key:String = "v\(index)"
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

extension UIColor {
    //Color palette: https://colorhunt.co/palette/28174
    
//    static let navBarColor = UIColor(red: 129/255, green: 45/255, blue: 88/255, alpha: 1)
//    static let cellColor = UIColor(red: 240/255, green: 162/255, blue: 142/255, alpha: 1)
//    static let backgroundColor = UIColor(red: 245/255, green: 215/255, blue: 161/255, alpha: 1)

//    navBarColor: #D29E56 static let navBarColor = UIColor(red: 210/255, green: 158/255, blue: 86/255, alpha: 1)
//    CellColor: #FDCF7A static let cellColor = UIColor(red: 253/255, green: 207/255, blue: 122/255, alpha: 1)
//    BackgroundColor: #FEEDA4 static let backgroundColor = UIColor(red: 254/255, green: 237/255, blue: 164/255, alpha: 1)
    static let colooor = #colorLiteral(red: 0.4039215686, green: 0.3725490196, blue: 0.6, alpha: 1)
    
    static let navBarColor = UIColor(red: 210/255, green: 158/255, blue: 86/255, alpha: 1)
    static let cellColor = UIColor(red: 253/255, green: 207/255, blue: 122/255, alpha: 1)
    static let backgroundColor = UIColor(red: 245/255, green: 215/255, blue: 161/255, alpha: 1)
}
