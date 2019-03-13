//
//  CoreDataStack.swift
//  PlaylistCoreData
//
//  Created by Brooke Kumpunen on 3/13/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "PlaylistCoreData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store \(error)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
