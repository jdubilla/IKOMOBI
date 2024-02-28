//
//  CoreDataStack.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Properties
    
    private let persistentContainerName = "Grocery"

    // MARK: - Singleton

   static let sharedInstance = CoreDataStack()
    
    // MARK: - Public

      var viewContext: NSManagedObjectContext {
        return CoreDataStack.sharedInstance.persistentContainer.viewContext
      }
    
    // MARK: - Private
    
    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: persistentContainerName)
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()

}
