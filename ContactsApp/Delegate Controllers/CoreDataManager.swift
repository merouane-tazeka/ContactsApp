//
//  CoreDataManager.swift
//  ContactsApp
//
//  Created by Merouane Tazeka on 2019-10-08.
//  Copyright © 2019 Merouane Tazeka. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load container: \(error)")
            }
        }
        return container
    }()
}
