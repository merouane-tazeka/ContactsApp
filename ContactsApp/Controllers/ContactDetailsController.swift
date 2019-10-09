//
//  ContactDetailsController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-07.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

class ContactDetailsController: UIViewController {
    
    //MARK: - Variable Declaration
    
    var contact: Person? {
        didSet {
            if let picture = contact?.profilPicture {
                profilePictureView.image = UIImage(data: picture)
            }
            
            if let firstName = contact?.name, let lastName = contact?.lastName {
                nameLabel.text = "\(firstName) \(lastName)"
            } else if let firstName = contact?.name {
                nameLabel.text = firstName
            }
            
            if let number = contact?.phoneNumber {
                let numberArray = number.components(separatedBy: " ")
                let numberToDisplay = "+1 (\(numberArray[1])) \(numberArray[2])-\(numberArray[3])\(numberArray[4])"
                phoneNumberLabel.text = numberToDisplay
            }
            
            if let email = contact?.email {
                emailAddressLabel.text = email
            }
        }
    }
    
    let profilePictureView: UIImageView = {
        let pv = UIImageView()
        pv.image = UIImage(named: "user")
        pv.layer.borderColor = UIColor.black.cgColor
        pv.layer.borderWidth = 1
        pv.clipsToBounds = true
        pv.contentMode = .scaleAspectFill
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "First & Last Name"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number:"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "No phone number"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "No email address"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    //MARK: - Setup Methods
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Return", style: .plain, target: self, action: #selector(handleReturnButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEditButton))
        view.backgroundColor = .cellColor
        navigationController?.navigationBar.barTintColor = .navBarColor
        navigationController?.navigationBar.prefersLargeTitles = false
        if let name = contact?.name {
            navigationItem.title = "\(name)'s info"
        } else {
            navigationItem.title = "Contact details page"
        }
    }
    
    private func setupView() {
        
        view.addSubview(profilePictureView)
        profilePictureView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        profilePictureView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        profilePictureView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profilePictureView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        setupImageStyle()
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: profilePictureView.bottomAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8).isActive = true
        phoneNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        view.addSubview(emailAddressLabel)
        emailAddressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailAddressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        emailAddressLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        emailAddressLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    //MARK: - Button Methods
    
    @objc private func handleReturnButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleEditButton() {
        
        //HERE GOES NEXT TASK
        print("Edit contact info")
    }
    
    //MARK: - Others Methods
    private func setupImageStyle() {
        profilePictureView.layer.cornerRadius = 100
    }
}
