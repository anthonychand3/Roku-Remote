//
//  ApiRoutes.swift
//  Roku Remote
//
//  Created by anthony chand on 3/18/22.
//

import Foundation
import SWXMLHash


class ApiRoutes {
    
    var deviceIpAddress: String?
    
    init(){
        print("loading api....")
        self.deviceIpAddress = UserDefaults.standard.string(forKey: "ipAddress")
    }
    
    func powerOn(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/PowerOn")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    
    func powerOff(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/PowerOff")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func returnToHome(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Home")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func muteVolume(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/VolumeMute")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func volumeUp(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/VolumeUp")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func volumeDown(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/VolumeDown")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func play(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Play")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func fastForward(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Fwd")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func rewind(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Rev")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func additionalOptions(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Info")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func arrowDown(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Down")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func arrowUp(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Up")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func arrowLeft(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Left")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func arrowRight(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Right")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func ok(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Select")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func back(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/Back")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    
    func instantReplay(){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/keypress/InstantReplay")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    
    func launchApp(id: String){
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/launch/" + id)
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        let postString = "";
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    func deviceInfo(completionBlock: @escaping (String) -> Void) async -> Void {
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/query/device-info")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                completionBlock(dataString)
                
            }
        }
        task.resume()
    }
    
    func getDeviceApps(completionBlock: @escaping ([Card]) -> Void) async -> Void {
        let url = URL(string: "http://" + self.deviceIpAddress! + ":8060/query/apps")
        
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            

            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                
                let apps = XMLHash.parse(dataString)
                var cards: [Card] = []
                for elem in apps["apps"]["app"].all {
                    cards.append(Card( id: UUID() , title: elem.element!.text, appId: (elem.element?.attribute(by: "id")!.text)!))
                    print(elem.element?.attribute(by: "id")! as Any)
                    print(elem.element?.text as Any)
                }
                completionBlock(cards)
                
            }
        }
        task.resume()
    }
}
