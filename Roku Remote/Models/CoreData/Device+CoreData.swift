//
//  Device+CoreData.swift
//  Roku Remote
//
//  Created by anthony chand on 4/24/22.
//

import Foundation

extension Device {
    
    
    func convertToManagedObject() -> DevicesEntity {
        
        let devicesEntity = DevicesEntity(context: PersistenceController.shared.container.viewContext)
        devicesEntity.ipAddress = self.ipAddress
        
        return devicesEntity
    }
    
    init(devicesEntity: DevicesEntity) {
        self.ipAddress = devicesEntity.ipAddress!
    }
    
}
