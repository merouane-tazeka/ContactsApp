//
//  AddContactController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

class AddContactController: UIViewController {
    
    lazy var coverImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageGesture)))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let tapToChoosePictureLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a picture"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    // MARK: - SetupView Methods
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.barTintColor = .navBarColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Add new contact"
        
        
        view.addSubview(coverImageView)
        coverImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        coverImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        setupImageStyle()
        
        view.addSubview(tapToChoosePictureLabel)
        tapToChoosePictureLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 15).isActive = true
        tapToChoosePictureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        tapToChoosePictureLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tapToChoosePictureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: tapToChoosePictureLabel.bottomAnchor, constant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelButton))
    }
    
    private func setupImageStyle() {
        coverImageView.layer.cornerRadius = coverImageView.frame.width / 2 == 0 ? 75 : coverImageView.frame.width / 2
        coverImageView.layer.borderColor = UIColor.black.cgColor
        coverImageView.layer.masksToBounds = true
        coverImageView.layer.borderWidth = 1
        
    }
    
    //MARK: - Methods
    
    @objc private func handleImageGesture() {
        
    }
    
    @objc private func handleAddButton() {

    }
    
    @objc private func handleCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    

}
