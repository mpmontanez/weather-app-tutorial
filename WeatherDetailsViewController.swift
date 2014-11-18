//
//  WeatherDetailsViewController.swift
//  matts-tutorial-11-18-14
//
//  Created by Matthew Montanez on 11/18/14.
//  Copyright (c) 2014 Matthew Montanez. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    var weatherData: String = ""
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background image.
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named:"trees-bg.png"))!)

        // Convert JSON weather data into a dictionary object.
        var jsondata_nsdata = (self.weatherData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        let jsonobj: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsondata_nsdata!,options:NSJSONReadingOptions.MutableContainers,
            error: nil) as NSDictionary
        
        // Display temperature.
        var temp = jsonobj["main"]!["temp"] as Int
        display.text = String(temp) + "\u{00B0}"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
