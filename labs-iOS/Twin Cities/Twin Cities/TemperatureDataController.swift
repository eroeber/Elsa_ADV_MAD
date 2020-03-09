//
//  TemperatureDataController.swift
//  Twin Cities
//
//  Created by Elsa Roeber on 3/7/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

// enum for errors
enum JsonError : Error{
    case BadURL
    case BadResponse
    case CouldNotParse
}

class TemperatureDataController{
    // stores the temperatures of the most recent call (set of two cities)
    var currentTemps = TemperatureData()
    var newTemp = Temperature(cityTemp: 0.0)
    
    // closure to notify the view controller when the json has been loaded and parsed
    var onDataUpdate:((_ data: Temperature) -> Void)?
    
    // makes the http request based on the latitude and longitude parameters
    func loadJson(latitude: String, longitude: String) throws{
        // construct the url
        let urlPath = "https://api.darksky.net/forecast/e63f082aa668e0dcb6e9eb295785fe2e/\(latitude),\(longitude)"
        // guard statement with conditional unwrapping to make sure the url is valid
        guard let url = URL(string: urlPath) else{
            throw JsonError.BadURL
        }
        let group = DispatchGroup()
        group.enter()
        
        // url is valid so make the request and give it a completionhandler closure
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
        // downcast to URLResponse since we made an https request
            let httpResponse = response as! HTTPURLResponse
        
        // get the status code
        let statusCode = httpResponse.statusCode
        
        // make sure we got a good response
        guard statusCode == 200 else{
            print("file download error")
            return
        }
        // download successful
        print("download complete")
        // parse json asynch
        DispatchQueue.main.async {self.parseJson(rawData: data!)}
        })
        session.resume()
    }
    
    // parses the raw data and notifies the view controller
    func parseJson(rawData: Data){
        // try to decode the response
        let parsedData = try? JSONSerialization.jsonObject(with: rawData, options: [])
        if let jsonDict = parsedData as? NSDictionary{
            if let currentTemp = jsonDict["currently"] as? NSDictionary{
                newTemp.cityTemp = Float(truncating: currentTemp.value(forKey: "temperature") as! NSNumber)
            }
        }
        
        // pass data back up to requesting object
        onDataUpdate?(newTemp)
    }
}
