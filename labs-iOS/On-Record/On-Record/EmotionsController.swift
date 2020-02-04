//
//  EmotionsController.swift
//  On-Record
//
//  Created by Elsa Roeber on 2/2/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

enum DataError: Error{
    case BadFilePath
    case CouldNotDecodeData
    case NoData
}

class EmotionsController{
    // class properties
    var emotionsData: [Emotions]?
    let filename = "emotions"
    
    // load data from p-list into an array
    func loadData() throws {
        print("loading data from plist...")
        // get the plist file based on the file path
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            // do stuff
            let decoder = PropertyListDecoder()
            do{
                // get file contents
                let data = try Data(contentsOf: pathURL)
                //  decode them using our struct as the type to decode to
                emotionsData =  try decoder.decode([Emotions].self, from: data)
                print("data loaded!")
            }catch{
                throw DataError.CouldNotDecodeData
            }
        }
        else{
            throw DataError.BadFilePath
        }
    }
    
    // grab all of the categories of emotions in my plist (return an array of strings)
    func getAllTypes() throws -> [String]{
        var categories = [String]()
        // make sure we got data
        if let data = emotionsData{
            for category in data{
                categories.append(category.type)
            }
            return categories
        }else{
            // no data
            throw DataError.NoData
        }
    }
    
    // get all emotions associated with a given category
    func getChoices(idx: Int) throws -> [String]{
        if let data = emotionsData{
            return data[idx].choices
        }else{
            // no data
            throw DataError.NoData
        }
    }
}
