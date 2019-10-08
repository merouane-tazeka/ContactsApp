//
//  ContactDetailsController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-07.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

class ContactDetailsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.barTintColor = .navBarColor
        navigationItem.title = "Contact Name"
    }
}
