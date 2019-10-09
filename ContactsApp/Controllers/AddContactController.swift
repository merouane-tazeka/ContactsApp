//
//  AddContactController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit
import CoreData

protocol AddContactControllerDelegate {
    func didAddContact(contact: Person)
}

class AddContactController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate : AddContactControllerDelegate?
    
    var imageToSave: UIImage?
    
    lazy var coverImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "user")
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
        label.text = "First Name: "
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter First Name (required)"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name: "
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Last Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number: "
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "(xxx)xxx-xxxx"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email: "
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Example@icloud.com"
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        coverImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        setupImageStyle()
        
        view.addSubview(tapToChoosePictureLabel)
        tapToChoosePictureLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 15).isActive = true
        tapToChoosePictureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        tapToChoosePictureLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tapToChoosePictureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: tapToChoosePictureLabel.bottomAnchor, constant: 30).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(lastNameLabel)
        lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        lastNameLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, constant: 0).isActive = true
        lastNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(lastNameTextField)
        lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.topAnchor, constant: 0).isActive = true
        lastNameTextField.leftAnchor.constraint(equalTo: lastNameLabel.rightAnchor, constant: 10).isActive = true
        lastNameTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 0).isActive = true
        lastNameTextField.bottomAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 8).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, constant: 0).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        view.addSubview(phoneTextField)
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: 0).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: phoneLabel.rightAnchor, constant: 10).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 0).isActive = true
        phoneTextField.bottomAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, constant: 0).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 0).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: nameTextField.rightAnchor, constant: 0).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAddButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelButton))
    }
    
    private func setupImageStyle() {
        coverImageView.layer.cornerRadius = coverImageView.frame.width / 2 == 0 ? 50 : coverImageView.frame.width / 2
        coverImageView.layer.borderColor = UIColor.black.cgColor
        coverImageView.layer.masksToBounds = true
        coverImageView.layer.borderWidth = 1
        
    }
    
    //MARK: - Methods
    
    @objc private func handleImageGesture() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            coverImageView.image = editedImage
            imageToSave = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            coverImageView.image = originalImage
            imageToSave = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleAddButton() {
        
        guard let name = nameTextField.text else { return }
        
        if name == "" {
            pushAlert(title: "Add a first name", message: "You need to add a first name to save a new contact", action: "Cancel")
        } else {
            let context = CoreDataManager.shared.persistantContainer.viewContext
            
            let contact = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
            
            contact.setValue(name, forKey: "name")
            contact.setValue(lastNameTextField.text, forKey: "lastName")
            
            guard verifyEnteredNumber(contact: contact) else { return }
            guard verifyEnteredEmail(contact: contact) else { return }
            
            if let image = imageToSave {
                if let imageData = image.jpegData(compressionQuality: 0.8) {
                    contact.setValue(imageData, forKey: "profilPicture")
                }
            }
            
            do {
                try context.save()
                
                dismiss(animated: true) {
                    self.delegate?.didAddContact(contact: contact as! Person)
                }
            } catch let saveErr {
                print("Failed saving new entry: ", saveErr)
            }
        }
        
        
    }
    
    @objc private func handleCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    private func pushAlert(title: String, message: String, action: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default))
        present(alert, animated: true)
    }

    //MARK: - Verification Methods
    
    private func verifyEnteredNumber(contact: NSManagedObject) -> Bool {
        if let phoneNumber = phoneTextField.text {
            if phoneNumber != "" {
                var phoneNumberToSave = ""
                for (index, number) in phoneNumber.enumerated() {
                    if index % 3 == 0 {
                        phoneNumberToSave += " " + String(number)
                    } else {
                        phoneNumberToSave += String(number)
                    }
                }
                
                if phoneNumberToSave.count != 14 {
                    pushAlert(title: "Insert a valid phone number (10 numbers)", message: "Phone style: xxxxxxxxxx", action: "Cancel")
                    return false
                }
                
                contact.setValue(phoneNumberToSave, forKey: "phoneNumber")
                
            }
        }
        return true
    }
    
    private func verifyEnteredEmail(contact: NSManagedObject) -> Bool {
        if let enteredText = emailTextField.text {
            if enteredText != "" {
                if enteredText.contains("@") {
                    contact.setValue(enteredText, forKey: "email")
                } else {
                    pushAlert(title: "Enter a valid email address", message: "", action: "Cancel")
                    return false
                }
            }
        }
        return true
    }

}
