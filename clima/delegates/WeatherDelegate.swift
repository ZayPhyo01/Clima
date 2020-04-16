//
//  WeatherDelegate.swift
//  clima
//
//  Created by Zay Phyo on 16/04/2020.
//  Copyright © 2020 Zay Phyo. All rights reserved.
//

import Foundation

protocol WeatherDelegate {
    func onSuccess (with vo : WeatherVo)
    func onError (s : String)
}
