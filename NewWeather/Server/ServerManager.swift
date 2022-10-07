//
//  ServerManager.swift
//  CRMClient
//
//  Created by Nurzhan Ababakirov on 3/5/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.

import UIKit
import Alamofire

class ServerManager: HTTPRequestManager  {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}

extension ServerManager {
    
    func getWeatherFiveList(_ completion: @escaping (WeatherFive) -> Void, _ error: @escaping (String) -> Void){
        let header: [String: String] = [
            "Content-Type": "application/json"
        ]
       self.get(url: "http://api.openweathermap.org/data/2.5/forecast?lat=42.874722&lon=74.612222&APPID=079587841f01c6b277a82c1c7788a6c3", header: header, completion: {
            (data) in
            do {
                guard let data = data else {return}
                let weatherFiveList = try JSONDecoder().decode(WeatherFive.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherFiveList)
                }
            } catch let err {
                       error(err.localizedDescription)
                print(err.localizedDescription)
                
                   }
               }, error: error)
    }
    
    func getWeatherOneList(_ completion: @escaping (WeatherOneStruct) -> Void, _ error: @escaping (String) -> Void){
        let header: [String: String] = [
            "Content-Type": "application/json"
        ]
       self.get(url: "http://api.openweathermap.org/data/2.5/weather?lat=42.874722&lon=74.612222&APPID=3331e666239ea2e7435b26c22893307c", header: header, completion: {
            (data) in
            do {
                guard let data = data else {return}
                let weatherOneList = try JSONDecoder().decode(WeatherOneStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherOneList)
                }
            } catch let err {
                       error(err.localizedDescription)
                print(err.localizedDescription)
                
                   }
               }, error: error)
    }

}
