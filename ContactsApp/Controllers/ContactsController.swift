//
//  ContactsController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit

class ContactsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var contacts: [Person]?
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        createContacts()
    }
    
    //MARK: - Setup Methods
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))
        navigationItem.title = "Contacts"
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK: - CollectionView Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts?.count ?? 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PersonCell
        
        cell.contacts = contacts?[indexPath.item]
        
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let contactDetailsController = ContactDetailsController()
        let navController = CustomNavigationController(rootViewController: contactDetailsController)
        
        present(navController, animated: true, completion: nil)
        
    }
    
    //MARK: - CollectionView Layout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (view.frame.width / 2) - 10, height: 200)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    //MARK: - Button Methods
    @objc func handleAddButton() {
        
        let addContactController = AddContactController()
        let navController = CustomNavigationController(rootViewController: addContactController)
        
        present(navController, animated: true, completion: nil)
        
    }
    
    //MARK: - Other Methods
    
    func createContacts() {
        contacts = [Person]()
//        let person1 = PersonModel(name: "Merouane", surname: "Tazeka")
//        let person2 = PersonModel(name: "Islam", surname: "Ouelhi")
//        contacts?.append(person1)
//        contacts?.append(person2)
    }
}

