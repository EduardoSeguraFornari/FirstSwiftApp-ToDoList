//
//  Task+CoreDataProperties.swift
//  TO DO List
//
//  Created by Eduardo Segura Fornari on 12/11/16.
//  Copyright © 2016 Fornari. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "TaskEntity");
    }

    @NSManaged public var taskDescription: String?
    @NSManaged public var taskName: String?
    

}
