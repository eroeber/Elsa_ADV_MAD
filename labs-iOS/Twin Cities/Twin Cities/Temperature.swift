//
//  Temperature.swift
//  Twin Cities
//
//  Created by Elsa Roeber on 3/7/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

struct Temperature : Decodable{
    var cityTemp : Float
}

struct TemperatureData : Decodable{
    var data = [Temperature]()
}
