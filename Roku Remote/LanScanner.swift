//
//  LanScanner.swift
//  Roku Remote
//
//  Created by anthony chand on 3/15/22.
//

protocol LanScannerDelegate {
    func lanScannerIPSearchFinished()
    func lanScannerIPSearchCancelled()
    func lanScannerIPSearchFailed()
}


class LanScanner: NSObject, MMLANScannerDelegate {
    
    var lanScanner : MMLANScanner!
    dynamic var connectedDevices : [MMDevice]!
    dynamic var isScanRunning : BooleanLiteralType = false
    dynamic var progressValue : Float = 0.0
    var delegate : LanScannerDelegate?
    
    init(delegate:LanScannerDelegate?){
        
        super.init()
        self.delegate = delegate!
        self.connectedDevices = [MMDevice]()
        self.isScanRunning = false
        self.lanScanner = MMLANScanner(delegate:self)
    }
    
    func startNetWorkScan() ->Void{
       
        if (self.isScanRunning) {
            
            self.stopNetWorkScan()
            self.connectedDevices.removeAll()
        }
        else {
            self.connectedDevices.removeAll()
            self.isScanRunning = true
            self.lanScanner.start()
        }
    }

    
    func stopNetWorkScan() ->Void{
        
        self.lanScanner.stop()
        self.isScanRunning = false
        
    }
    
    
    func lanScanDidFindNewDevice(_ device: MMDevice!){
        if(!self.connectedDevices .contains(device)) {
            self.connectedDevices?.append(device)
        }
        
        let ipSortDescriptor = NSSortDescriptor(key: "ipAddress", ascending: true)
        self.connectedDevices = (self.connectedDevices as NSArray).sortedArray(using: [ipSortDescriptor]) as? Array
    }
    
    
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus){
        self.isScanRunning = false
        self.lanScanner.stop()
        
        //Checks the status of finished. Then call the appropriate method
        if (status == MMLanScannerStatusFinished) {
            
            self.delegate?.lanScannerIPSearchFinished()
        }
        else if (status == MMLanScannerStatusCancelled) {
            
            self.delegate?.lanScannerIPSearchCancelled()
        }
        
    }
    func lanScanProgressPinged(_ pingedHosts: Float, from overallHosts: Int)
    {
        //Updating the progress value. MainVC will be notified by KVO
        self.progressValue = pingedHosts / Float(overallHosts)
    }
    func lanScanDidFailedToScan(){}
}
