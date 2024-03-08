//
//  APIClient.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

// Class to make the connection to the API.
final class APIClient {
    
    // MARK: Properties
    
    // MARK: Methods
    
    /// Gets the data
    /// - Returns: The data or an Error
    func getUser() async -> Result<UserResponseModel, NetworkErrors> {
        
        // Validate Url
        guard let apiUrl = URL(string: "https://randomuser.me/api/") else {
            return .failure(.invalidURL)
        }
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(from: apiUrl)

            // Validate http Response
            guard let httpResponse = response as? HTTPURLResponse else{
                return .failure(.httpResponseError)
            }
            
            // Valide Http Code
            if (httpResponse.statusCode > 299){
                return .failure(.statusCodeError)
            }
            
            // Parsing data
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(UserResponseModel.self, from: data)
                return .success(decodeData)
            } catch {
                return .failure(.couldNotDecodeData)
            }
            
        } catch {
            return .failure(.generic)
        }
    }

}
