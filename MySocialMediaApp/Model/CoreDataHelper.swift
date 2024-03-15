//
//  CoreDataHelper.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 09/03/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    static var userArray: [Users]?
    
    // Obtener el contexto de Core Data
    static let managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No se pudo obtener el delegate de la aplicación")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    // Método para recuperar un arreglo de nombres desde Core Data
    static func recuperarArregloDesdeCoreData() {
        
        do {
            
            userArray = try managedContext.fetch(Users.fetchRequest())
            // let users = try managedContext.fetch(Users.fetchRequest())
            // return users
        } catch {
            print("Error al recuperar los items de Core Data: \(error)")
            // return []
        }
    }
    
    // Método para guardar un arreglo de nombres en Core Data
    static func guardarArregloEnCoreData(_ user: [UserDataModel]) {
        
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
            print("Error al guardar el item en Core Data: \(error)")
        }
        
        // Guardar el nuevo item en Core Data
        self.recuperarArregloDesdeCoreData()
        
    }
    
}
