//
//  ViewController.swift
//  Twin Cities
//
//  Created by Elsa Roeber on 3/7/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // Melbourne, Australia vs Melbourne, FL
    // Glasgow, MT vs Glasgow, Scotland
    // Springfield, NJ vs Springfield, IL
    // Paris, France vs Paris, TX
    // Beverly Hills, CA vs Beverly Hills, TX
    // Moscow, Russia vs Moscow KS
    // Naples, Italy vs Naples, FL
    
    // variables
    var myCities = [cityInfo]()
    var tempAPI = TemperatureDataController()
    var valuesFound = false
    var pickedCity = Int() // index of picker
    var foundTemps = [Temperature]() // stores values from api call

    // outlets
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // actions
    @IBAction func checkTemps(_ sender: Any) {
        pickedCity = cityPicker.selectedRow(inComponent: 0)
        // clear old values
        foundTemps.removeAll()
        // call api
        do{
            try tempAPI.loadJson(latitude: myCities[pickedCity].lat1, longitude: myCities[pickedCity].long1)
        }
        catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempAPI.onDataUpdate = {[weak self] (data: Temperature) in self!.callMade(weather: data)}
        setUpCity()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        myCities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myCities[row].name
    }
    
    func callMade(weather: Temperature){
        if valuesFound == false { // one value found, need one more
            valuesFound = true
            do{
                foundTemps.append(weather)
                try tempAPI.loadJson(latitude: myCities[pickedCity].lat2, longitude: myCities[pickedCity].long2)
            }
            catch{
                print(error)
            }
        } else {
            valuesFound = false
            foundTemps.append(weather)
            if(foundTemps[0].cityTemp < foundTemps[1].cityTemp){
                
                resultLabel.text = myCities[pickedCity].city1
            } else {
                resultLabel.text = myCities[pickedCity].city2
            }
            print("\(foundTemps[0].cityTemp), \(foundTemps[1].cityTemp)")
        }
    }
    
    func setUpCity(){
        let pear1 = cityInfo(name: "Melbourne", lat1: "37.8", long1: "144.9", lat2: "28.0", long2: "80.6", city1: "Melbourne Australia is cooler than Melbourne Florida!", city2: "Melbourne Florida is cooler than Melbourne Australia!")
        let pear2 = cityInfo(name: "Glasgow", lat1: "80.6", long1: "106.6", lat2: "55.8", long2: "4.2", city1: "Glasgow Montana is cooler than Glasgow Scotland!", city2: "Glasgow Scotland is cooler than Glasgow Montana!")
        let pear3 = cityInfo(name: "Springfield", lat1: "40.7", long1: "74.3", lat2: "39.7", long2: "89.6", city1: "Springfield New Jersey is cooler than Springfield Illinois!", city2: "Springfield Illinois is cooler than Springield New Jersey!")
        let pear4 = cityInfo(name: "Paris", lat1: "48.8", long1: "2.3", lat2: "33.6", long2: "95.5", city1: "Paris France is cooler than Paris Texas!", city2: "Paris Texas is cooler than Paris France!")
        let pear5 = cityInfo(name: "Beverly Hills", lat1: "34.0", long1: "118.4", lat2: "31.5", long2: "97.1", city1: "Beverly Hills California is cooler than Beverly Hills Texas!", city2: "Beverly Hills Texas is cooler than Beverly Hills California!")
        let pear6 = cityInfo(name: "Moscow", lat1: "55.7", long1: "37.6", lat2: "37.3", long2: "101.2", city1: "Moscow Russia is cooler than Moscow Kansas!", city2: "Moscow Kansas is cooler than Moscow Russia!")
        let pear7 = cityInfo(name: "Naples", lat1: "40.8", long1: "14.2", lat2: "26.1", long2: "81.7", city1: "Naples Italy is cooler than Naples FLorida!", city2: "Naples Florida is cooler than Napes Italy!")
        
        myCities.append(pear1)
        myCities.append(pear2)
        myCities.append(pear3)
        myCities.append(pear4)
        myCities.append(pear5)
        myCities.append(pear6)
        myCities.append(pear7)
    }


}

