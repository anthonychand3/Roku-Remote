//
//  DevicesEntity+CoreDataProperties.swift
//  Roku Remote
//
//  Created by anthony chand on 4/24/22.
//
//

import Foundation
import CoreData


extension DevicesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DevicesEntity> {
        return NSFetchRequest<DevicesEntity>(entityName: "DevicesEntity")
    }

    @NSManaged public var ipAddress: String?
    @NSManaged public var device: NSSet?

}

// MARK: Generated accessors for device
extension DevicesEntity {

    @objc(addDeviceObject:)
    @NSManaged public func addToDevice(_ value: DevicesEntity)

    @objc(removeDeviceObject:)
    @NSManaged public func removeFromDevice(_ value: DevicesEntity)

    @objc(addDevice:)
    @NSManaged public func addToDevice(_ values: NSSet)

    @objc(removeDevice:)
    @NSManaged public func removeFromDevice(_ values: NSSet)

}

extension DevicesEntity : Identifiable {

}
