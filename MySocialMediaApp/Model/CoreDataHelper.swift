//
//  CoreDataHelper.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 09/03/24.
//

import Foundation
import CoreData
import UIKit

/// Helper class to save user registration in persistently store the objects of the application
class CoreDataHelper {
    
    static var userArray: [Users]?  // Array to save users

    /// Gets Core Data context
    static let managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Could not get application delegate")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    /// Retrieves an array of names from Core Data
    static func retrieveArrayFromCoreData() {
        
        do {
            
            userArray = try managedContext.fetch(Users.fetchRequest())

        } catch {
            print("Error retrieving Core Data items: \(error)")

        }
    }
    
    /// Saves an array of names in Core Data
    /// - Parameter user: User data
    static func saveArrayInCoreData(_ user: [UserDataModel]) {
        
        for field in user {
            let newUser = Users(context: managedContext)
            newUser.title = field.title
            newUser.first = field.first
            newUser.last = field.last
            newUser.city = field.city
            newUser.state = field.state
            newUser.country = field.country
            newUser.postcode = Int64(field.postcode!)
            newUser.email = field.email
        }
        
        
        do {
            try managedContext.save()
            print("Item guardado en Core Data: \(user)")
        } catch {
            print("Error when saving item in Core Data: \(error)")
        }
        
        // Save the new item in Core Data
        self.retrieveArrayFromCoreData()
        
    }
    
}
