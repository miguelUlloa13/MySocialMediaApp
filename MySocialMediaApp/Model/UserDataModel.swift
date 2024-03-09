//
//  UserDataModel.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 08/03/24.
//

import Foundation

struct UserDataModel: Decodable {
    
    // Name
    var title: String?
    var first: String?
    var last: String?
    
    // Address
    var city: String?
    var state: String?
    var country: String?
    var postcode: Int?
    
    // Email
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case title
        case first
        case last
        
        case location
        case city
        case state
        case country
        case postcode
        
        case email
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.email = try container.decode(String.self, forKey: .email)
        
        let name = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .name)
        let location = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        
        // se accede a la informacion de la key address
        self.title = try name.decode(String.self, forKey: .title)
        self.first = try name.decode(String.self, forKey: .first)
        self.last = try name.decode(String.self, forKey: .last)
        
        self.city = try location.decode(String.self, forKey: .city)
        self.state = try location.decode(String.self, forKey: .state)
        self.country = try location.decode(String.self, forKey: .country)
        self.postcode = try location.decode(Int.self, forKey: .postcode)
        
    }
    
}
