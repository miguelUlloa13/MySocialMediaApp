//
//  Users+CoreDataProperties.swift
//  MySocialMediaApp
//
//  Created by Miguel Ulloa on 09/03/24.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var title: String?
    @NSManaged public var first: String?
    @NSManaged public var last: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var postcode: Int64
    @NSManaged public var email: String?

}

extension Users : Identifiable {

}
