//
//  KeyChainHelper.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 10/03/24.
//

import Foundation
import UIKit
import Security



/// Helper class to save user credentials in the application
class KeychainHelper {
    
    static var serviceName = "MySocialMediaApp"
    static let usernameKey = "Username"
    static let passwordKey = "Password"
    
    /// Saves user credentials
    /// - Parameters:
    ///   - username: Username
    ///   - password: Password
    static func saveCredentials(username: String, password: String) {
        
        guard let usernameData = username.data(using: .utf8),
                      let passwordData = password.data(using: .utf8) else {
                    return
                }
                
                let usernameQuery: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: serviceName,
                    kSecAttrAccount as String: usernameKey,
                    kSecValueData as String: usernameData
                ]
                
                let passwordQuery: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: serviceName,
                    kSecAttrAccount as String: passwordKey,
                    kSecValueData as String: passwordData
                ]
                
                SecItemDelete(usernameQuery as CFDictionary)
                SecItemDelete(passwordQuery as CFDictionary)
                
                let status1 = SecItemAdd(usernameQuery as CFDictionary, nil)
                let status2 = SecItemAdd(passwordQuery as CFDictionary, nil)
        
        
        if status1 == errSecSuccess && status2 == errSecSuccess {
            print("User saved successfully in the keychain")
        } else {
            print("Something went wrong trying to save the user in the keychain")
        }
        
    }
    
    /// Recovers the credentials
    /// - Returns: Username and password
    static func recoverCredentials() -> (String, String)? {
        let usernameQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: usernameKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        let passwordQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: passwordKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var usernameData: AnyObject?
        var passwordData: AnyObject?
        
        let status1 = SecItemCopyMatching(usernameQuery as CFDictionary, &usernameData)
        let status2 = SecItemCopyMatching(passwordQuery as CFDictionary, &passwordData)
        
        guard status1 == errSecSuccess, status2 == errSecSuccess,
              let username = String(data: usernameData as! Data, encoding: .utf8),
              let password = String(data: passwordData as! Data, encoding: .utf8) else {
            return nil
        }
        
        return (username, password)
    }
    
    /// Deletes user credentials
    static func deleteCredentials() {
        
        let usernameQuery: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: serviceName,
                    kSecAttrAccount as String: usernameKey
                ]
                
                let passwordQuery: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: serviceName,
                    kSecAttrAccount as String: passwordKey
                ]
                
                let status1 = SecItemDelete(usernameQuery as CFDictionary)
                let status2 = SecItemDelete(passwordQuery as CFDictionary)
                
        
        // Find user and delete
        if status1 == errSecSuccess && status2 == errSecSuccess {
            print("User removed successfully from the keychain")
        } else {
            print("Something went wrong trying to remove the user from the keychain")
        }
    }
}
