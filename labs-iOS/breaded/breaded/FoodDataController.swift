//
//  FoodDataController.swift
//  breaded
//
//  Created by Elsa Roeber on 2/19/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

class FoodDataController{
    var things: [String]?
    let filename = "things-to-add"


    enum ListError: Error{
        case NoDataFile
        case CouldNotDecode
        case NoWords
    }

    func loadWords() throws{
        // check if we have the file
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            // plist decoder object
            let plistDecoder = PropertyListDecoder()
            
            do{
                // try to get the data and decode into array of strings
                let data = try Data(contentsOf: pathURL)
                things = try plistDecoder.decode([String].self, from: data)
            } catch{
                print(error)
                throw ListError.CouldNotDecode
            }
        }
    }
    
    // put all the words back in array of strings and return it
    func getWords() throws -> [String]{
        // check to see if we have words via conditional unwrapping
        if let words = things{
            return words
        }else{
            throw ListError.NoWords
        }
    }

}
