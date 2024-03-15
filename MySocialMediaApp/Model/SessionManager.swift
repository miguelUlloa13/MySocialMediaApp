//
//  SessionManager.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 10/03/24.
//

import Foundation
import UIKit

class SessionManager {
    
    let userDefaults = UserDefaults.standard
    let lastLoginKey = "lastLogin"
    let logoutTimeInSeconds: TimeInterval = 3 * 60 // 5 minutos
    
    func saveLastConnection() {
        if let firstOpen = UserDefaults.standard.object(forKey: lastLoginKey) as? Date {
            UserDefaults.standard.set(Date(), forKey: lastLoginKey)
            print(firstOpen)
        } else {
            // This is the first launch
            UserDefaults.standard.set(Date(), forKey: lastLoginKey)
            
            
        }
    }
    

}

class UserDefaultsManager {
    // Define las claves para tus datos en UserDefaults
    enum Key: String {
        case lastLoginKey
        case puntajeMaximo
        // Agrega más claves según sea necesario
    }

    // Método para guardar un valor en UserDefaults
    static func guardarValor(forKey key: Key) {
        
        if let firstOpen = UserDefaults.standard.object(forKey: key.rawValue) as? Date {
            UserDefaults.standard.set(Date(), forKey: key.rawValue)
            print(firstOpen)
            UserDefaults.standard.synchronize()
        } else {
            UserDefaults.standard.set(Date(), forKey: key.rawValue)
            UserDefaults.standard.synchronize()
        }
        
        
        
    }

    // Método para recuperar un valor de UserDefaults
    static func recuperarValor(forKey key: Key) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }

    // Método para eliminar un valor de UserDefaults
    static func eliminarValor(forKey key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
