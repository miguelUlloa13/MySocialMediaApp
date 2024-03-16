//
//  ValidateString.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

/// Class to validate Strings
class ValidateString {
    
    /// Validate an email
    /// - Parameter email: Email to validate
    /// - Returns: True if the email complies with the format
    func isValidEmail(_ email: String) -> Bool {
        let usrName = "[A-Z0-9a-z._%+-]"    // Username Regular Expression
        let provider = "[A-Za-z0-9.-]"      // Mail Provider Regular Expression
        let domain = "[A-Za-z]"             // Domain type
        let emailRegEx = usrName + "+@" + provider + "+\\." +  domain + "{2,64}"    // Regular Expression complete
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }
    
    /// Validates if the string contains letters
    /// - Parameter letterString: String to validate
    /// - Returns: True if the string contains only letters
    func containsOnlyLetters(letterString: String) -> Bool {
        let onlyLettersRegEx = "^[a-zA-Z]+$"
        let onlyLettersPred = NSPredicate(format:"SELF MATCHES %@", onlyLettersRegEx)
        let result = onlyLettersPred.evaluate(with: letterString)
        
        return result
    }
    
    /// Validates if the string contains numbers
    /// - Parameter numberString: String to validate
    /// - Returns: True if the string contains only numbers
    func containsOnlyNumbers(numberString: String) -> Bool {
        let onlyNumbersRegEx = "^[0-9]+$"
        let onlyNumbersPred = NSPredicate(format:"SELF MATCHES %@", onlyNumbersRegEx)
        let result = onlyNumbersPred.evaluate(with: numberString)
        
        return result
    }
}
