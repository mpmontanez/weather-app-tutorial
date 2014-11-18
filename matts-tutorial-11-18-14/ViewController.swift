//
//  ViewController.swift
//  matts-tutorial-11-18-14
//
//  Created by Matthew Montanez on 11/18/14.
//  Copyright (c) 2014 Matthew Montanez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weatherData: NSString = ""
    @IBOutlet weak var zipCodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background image.
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named:"ocean-bg.png"))!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func getWeatherAction(sender: AnyObject) {
        
        // Call the weather API.
        var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=\(zipCodeField.text)&units=imperial"
        var encodedApiUrl = apiUrl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        // Pass data to next view and segue.
        let httpobj = SwiftHttp()
        httpobj.HTTPGet(encodedApiUrl!) {
            (data: String, error: String?) -> Void in
            // Handle errors.
            if (error != nil) {
                println(error)
            }
            // Otherwise, retrieve data and perform segue.
            else {
                self.weatherData = data
                println(data)
                dispatch_async(dispatch_get_main_queue(), {
                    self.performSegueWithIdentifier("viewWeatherDetails", sender: self)
                })
            }
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        // Forward the weather data to the details view controller.
        let destinationVC:WeatherDetailsViewController = segue.destinationViewController as WeatherDetailsViewController
        destinationVC.weatherData = self.weatherData
    }
}

