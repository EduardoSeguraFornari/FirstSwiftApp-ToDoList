//
//  Task+CoreDataClass.swift
//  TO DO List
//
//  Created by Eduardo Segura Fornari on 11/11/16.
//  Copyright © 2016 Fornari. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    @NSManaged public var taskDescription: String?
    @NSManaged public var taskName: String?
}
