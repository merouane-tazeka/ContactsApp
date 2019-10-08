//
//  ContactsController.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-06.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import UIKit
import CoreData

class ContactsController: UICollectionViewController, UICollectionViewDelegateFlowLayout, AddContactControllerDelegate {
    
    var contacts = [Person]()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
        fetchContacts()
    }
    
    //MARK: - Setup Methods
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Options", style: .plain, target: self, action: #selector(handleOptionButton))
        navigationItem.title = "Contacts"
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK: - CollectionView Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PersonCell
        
        cell.contact = contacts[indexPath.item]
        

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
    @objc private func handleAddButton() {
        
        let addContactController = AddContactController()
        addContactController.delegate = self
        
        let navController = CustomNavigationController(rootViewController: addContactController)
        
        
        present(navController, animated: true, completion: nil)
        
    }
    
    @objc private func handleOptionButton() {
        
        let alert = UIAlertController(title: "Select an option", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete all contacts", style: .default, handler: handlerDeleteAll))
        
        present(alert, animated: true)
    }
    
    @objc private func handlerDeleteAll(action: UIAlertAction) {
        
        let context = CoreDataManager.shared.persistantContainer.viewContext
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Person.fetchRequest())
        do {
            try context.execute(batchDeleteRequest)
            
            var indexPathToRemove = [IndexPath]()
            
            for (index, _) in contacts.enumerated() {
                let indexPath = IndexPath(item: index, section: 0)
                indexPathToRemove.append(indexPath)
            }
            contacts.removeAll()
            collectionView.deleteItems(at: indexPathToRemove)
            
        } catch let deleteErr {
            print("Failed deleting contacts from database: ", deleteErr)
        }
    }
    
    //MARK: - Other Methods
    
    func fetchContacts() {
        let context = CoreDataManager.shared.persistantContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        
        do {
            let coredataContacts = try context.fetch(fetchRequest)
            
            contacts = coredataContacts
            collectionView.reloadData()
        } catch let fetchErr {
            print("Failed fetching data from context: ", fetchErr)
        }
        
        
    }
    
    func didAddContact(contact: Person) {
        let newContact = contact
        
        contacts.append(newContact)
        let newIndexPath = IndexPath(item: contacts.count - 1, section: 0)
        collectionView.insertItems(at: [newIndexPath])
    }
}

