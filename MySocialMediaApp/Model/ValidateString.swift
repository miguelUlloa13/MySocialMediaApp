//
//  ValidateString.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

class ValidateString {
    // Metodo para validar un email
    func isValidEmail(_ email: String) -> Bool {
        let usrName = "[A-Z0-9a-z._%+-]"    // Exprecion regular del nombre de usuario
        let provider = "[A-Za-z0-9.-]"      // Exprecion regular del proveedor del correo
        let domain = "[A-Za-z]"             // Tipo de dominio
        let emailRegEx = usrName + "+@" + provider + "+\\." +  domain + "{2,64}"    // Exprecion regular completa
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }

    // Metodo para validar el password
        // Longitud de 6 a 16 caracteres
        // Permite ingresar el alfabeto
        // Es necesario un caracter especial
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#+!%*?&])[A-Za-z\\d$@$#!+%*?&]{6,16}"
        
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordPred.evaluate(with: password)
        return result
    }
    
    func containsOnlyLetters(letterString: String) -> Bool {
        let onlyLettersRegEx = "^[a-zA-Z]+$"
        let onlyLettersPred = NSPredicate(format:"SELF MATCHES %@", onlyLettersRegEx)
        let result = onlyLettersPred.evaluate(with: letterString)
        
        return result
    }
    
    func containsOnlyNumbers(numberString: String) -> Bool {
        let onlyNumbersRegEx = "^[0-9]+$"
        let onlyNumbersPred = NSPredicate(format:"SELF MATCHES %@", onlyNumbersRegEx)
        let result = onlyNumbersPred.evaluate(with: numberString)
        
        return result
    }
}
