//
//  DataController.swift
//  Vroom
//
//  Created by Elsa Roeber on 3/7/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

enum DataError : Error{
    case NoDataFile
    case CouldNotDecode
    case NoWords
}

class DataController{
    var truckArray : [NameDetails]?
    let filename = "truckSpecs"
    
    func loadData() throws {
        print("loading data...")
        // check if we have the file
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            // plist decoder object
            let plistDecoder = PropertyListDecoder()
            
            do{
                // try to get the data into array of names
                let data = try Data(contentsOf: pathURL)
                truckArray = try plistDecoder.decode([NameDetails].self, from: data)
            } catch {
                print(error)
                throw DataError.CouldNotDecode
            }
        } else  {
            // could not find file
            throw DataError.NoDataFile
        }
    }
    
    func getAllNames() throws -> [String]{
        var truckNames = [String]()
        // make sure there is data
        if let data = truckArray{
            for truck in data{
                truckNames.append(truck.name)
            }
            return truckNames
        }
        else {
            // no data was accessed
            throw DataError.NoDataFile
        }
    }
    
    func getDebuts() throws -> [String]{
        var truckDebuts = [String]()
        if let data = truckArray{
            for debut in data{
                truckDebuts.append(debut.details[0])
            }
            return truckDebuts
        } else {
            // we don't have data
            throw DataError.NoDataFile
        }
    }
    
    func getSongs() throws -> [String]{
        var truckSongs = [String]()
        if let data =  truckArray{
            for song in data{
                truckSongs.append(song.details[3])
            }
            return truckSongs
        } else {
            throw DataError.NoDataFile
        }
    }
    
    func getBPM() throws -> [String]{
        var truckSpeeds =  [String]()
        if let data = truckArray{
            for speed in data{
                truckSpeeds.append(speed.details[1])
            }
            return truckSpeeds
        } else {
            throw DataError.NoDataFile
        }
    }
    
    func getRGB() throws -> [String]{
        var truckColors = [String]()
        if let data = truckArray{
            for color in data{
                truckColors.append(color.details[2])
            }
            return truckColors
        } else {
            throw DataError.NoDataFile
        }
    }
    
}


