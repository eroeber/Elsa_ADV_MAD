//
//  Sandwiches.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

// need to conform to Codable protocal because we will be encoding and decoding

struct SandwichDataModel: Codable{
    var sandwich: String
    var ingredients: [String]
}

enum DataError: Error{
    case NoDataFile
    case CouldNotDecode
    case CouldNotEncode
}

// class with methods to add and delete ingredients from sandwiches
class SandwichDataController{
    var allData = [SandwichDataModel]()
    let filename = "sandwiches"
    
    let dataFileName = "data.plist" // constant we will be writing to
    
    // load data from plist
    func loadData() throws{
        let pathURL: URL?
        
        // get the path where our data file would be
        let dataFileURL = getDataFile(datafile: dataFileName)
        
        // check to see if the data file exists
        if FileManager.default.fileExists(atPath: dataFileURL.path){
            pathURL = dataFileURL
        }else{
            // load default data (no user input data was found)
            pathURL = Bundle.main.url(forResource: filename, withExtension: "plist")
        }
        
        
        // check for file in project and get url
        if let dataURL = pathURL{
            let decoder = PropertyListDecoder()
            do{
                // get byte buffer
                let data = try Data(contentsOf: dataURL)
                // decode data to our model
                allData = try decoder.decode([SandwichDataModel].self, from: data)
            }catch{
                throw DataError.CouldNotDecode
            }
        }
        else{
            // couldn't get path for url
            throw DataError.NoDataFile
        }
    }
    
    // get all the sandwiches
    func getSandwiches() -> [String] {
        // create empty array to hole them
        var allSandwiches = [String]()
        // loop through data and append sandwiches to the array
        for item in allData{
            allSandwiches.append(item.sandwich)
        }
        return allSandwiches
    }
    
    // get array of ingredients based on sandwich
    func getIngredients(idx: Int) -> [String]{
        return allData[idx].ingredients
    }
    
    // add an ingredient to sandwich
    func addIngredient(dataIdx: Int, newIngredient: String, ingredientIdx: Int){
        allData[dataIdx].ingredients.insert(newIngredient, at: ingredientIdx)
    }
    
    // delete an ingredient from sandwich
    func deleteIngredient(dataIdx: Int, ingredientIdx: Int){
        allData[dataIdx].ingredients.remove(at: ingredientIdx)
    }
    
    func getDataFile(datafile: String) -> URL {
        // get path for data file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0] // documents directory
        
        // url for our plist
        return docDir.appendingPathComponent(datafile)
    }
    
    func writeData() throws {
        let dataFileURL = getDataFile(datafile: dataFileName)
        // get an encoder
        let encoder = PropertyListEncoder()
        // set format, plist is a type of xml
        encoder.outputFormat = .xml
        do{
            let data = try encoder.encode(allData.self)
            try data.write(to: dataFileURL)
        }catch{
            print(error)
            throw DataError.CouldNotEncode
        }
    }
}
