//
//  WeatherVo.swift
//  clima
//
//  Created by Zay Phyo on 16/04/2020.
//  Copyright © 2020 Zay Phyo. All rights reserved.
//

import Foundation

struct WeatherVo : Codable {
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
    let description : String
}
