//
//  WeatherModel.swift
//  clima
//
//  Created by Zay Phyo on 16/04/2020.
//  Copyright © 2020 Zay Phyo. All rights reserved.
//

import Foundation

class  WeatherModel : WeatherNetworkDelegate {
    func onSuccess(with vo: WeatherVo) {
        print("temp : \(vo.main.temp)")
        if let d = delegate {
            d.onSuccess(with: vo)
        }
    }
    
    func onError(s: String) {
      print(s)
    }
    
    
    private var agent : WeatherDataAgent?
    private var delegate : WeatherDelegate?
    
    init(delegate with : WeatherDelegate) {
        self.agent = WeatherDataAgent(delegate : self)
        self.delegate = with
    }
    
    func getWeatherDataByCountry(name n : String ) {
        print("Start Loading")
        agent?.getWeatherByCountry(countryName: n)
    }
}
