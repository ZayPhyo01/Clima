//
//  WeatherDataAgent.swift
//  clima
//
//  Created by Zay Phyo on 16/04/2020.
//  Copyright © 2020 Zay Phyo. All rights reserved.
//

import Foundation

class WeatherDataAgent {
    
    var delegate : WeatherNetworkDelegate?
    let ERROR_MESSAGE = "Can't load data"
    
    init(delegate : WeatherNetworkDelegate) {
        urlSession = URLSession(configuration: URLSessionConfiguration.default)
        self.delegate = delegate
    }
    
    let url = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=Your api key"
    
    let urlSession : URLSession?
    
    func getWeatherByCountry(countryName c : String) {
        if let urlForSession = URL(string: url) {
            let dataTask = urlSession?.dataTask(with: urlForSession) {
                (data , response , i) in
                if let sureData = data {
                    self.perform(data: sureData)
                } else {
                    self.responseErrorHelper()
                }
            }
            dataTask?.resume()
        } else {
            self.responseErrorHelper()
        }
    }
    
    private func perform(data : Data) {
        let decoder = JSONDecoder()
        do {
            let vo = try decoder.decode(WeatherVo.self, from: data)
            self.delegate?.onSuccess(with : vo)
        } catch {
            self.responseErrorHelper("Decode fail")
        }
    }
    
    private func responseErrorHelper (_ s : String = "Can't load data ") {
        self.delegate?.onError(s: s)
    }
}
