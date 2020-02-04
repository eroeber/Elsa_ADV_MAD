//
//  Emotions.swift
//  On-Record
//
//  Created by Elsa Roeber on 2/2/20.
//  Copyright © 2020 Elsa Roeber. All rights reserved.
//

import Foundation

struct Emotions: Decodable{
    let type: String
    let choices: [String]
}
