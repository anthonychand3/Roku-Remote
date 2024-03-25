//
//  DeviceManager.swift
//  Roku Remote
//
//  Created by anthony chand on 4/24/22.
//

import Foundation
import CoreData

struct CoreDataModel {
    
    var device: [Device] { return [] }
    
    static var context = PersistenceController.shared.container.viewContext
    
    //Populating/Clearing methods
    func emptyDB() {
        let deviceFetchRequest: NSFetchRequest<NSFetchRequestResult> = DevicesEntity.fetchRequest()
        let deviceDeleteRequest = NSBatchDeleteRequest(fetchRequest: deviceFetchRequest)
        
        do {
            try CoreDataModel.context.execute(deviceDeleteRequest)
        } catch let error as NSError {
            print("error during deletion \(error.localizedDescription)")
        }
    }
    
    func loadAllDatabaseData() async
    {
        emptyDB()
        
    }
    
    static func getDeviveWith(ipAddress: String) -> DevicesEntity?
    {
        let request: NSFetchRequest<DevicesEntity> = DevicesEntity.fetchRequest()
        request.predicate = NSPredicate(format: "ipAddress == %@", ipAddress)
        
        do {
            let device = try CoreDataModel.context.fetch(request).first
            return device
        } catch {
            print("ipAddress fetch failed")
            return nil
        }
    }
    
    func assign(device ipAddress: String)
    {
        let deviceRequest: NSFetchRequest<DevicesEntity> = DevicesEntity.fetchRequest()
        deviceRequest.predicate = NSPredicate(format: "ipAddress == %@", ipAddress)
        
        let deviceEntity = Device.init(ipAddress: ipAddress).convertToManagedObject()
        
        do {
            let device = try CoreDataModel.context.fetch(deviceRequest).first!
            device.addToDevice(deviceEntity)
            try CoreDataModel.context.save()
        } catch {
            print("Assignment of assignment to student failed")
        }
    }
}
