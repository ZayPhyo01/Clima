//
//  ViewController.swift
//  clima
//
//  Created by Zay Phyo on 16/04/2020.
//  Copyright © 2020 Zay Phyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , WeatherDelegate {
    
    func onSuccess(with vo: WeatherVo) {
        DispatchQueue.main.async{
            self.tvTemp.text = vo.main.temp.toString()
        }
    }
    
    func onError(s: String) {
         
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = WeatherModel(delegate : self)
        model.getWeatherDataByCountry(name : "London")
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tvTemp: UILabel!
    
}

