//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Constants
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = ""
    /***Get your own App ID at https://openweathermap.org/appid ****/

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //MARK: - Networking
  
    func getWeatherData(url: String, parameters: [String: String]){
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got the weather data")
                
                let weatherJSON : JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
            }
            else {
                print("Error \(response.result.error)")
                self.cityLabel.text = "Connection Issues"
            }
        }
        
    }
    
    
    //MARK: - JSON Parsing
    func updateWeatherData(json: JSON){
        
    }

    
    
    //MARK: - UI Updates
    /***************************************************************/
    //Write the updateUIWithWeatherData method here:
        
    
    
    //MARK: - Location Manager Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            if location.horizontalAccuracy > 0 {
                locationManager.stopUpdatingLocation()
                locationManager.delegate = nil
                
                print("Longitude = \(location.coordinate.longitude), Latitude = \(location.coordinate.latitude)")
                
                let latitude = String(location.coordinate.latitude)
                let longitude = String(location.coordinate.longitude)

                let params: Dictionary<String,String> = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
                
                getWeatherData(url: WEATHER_URL, parameters: params)
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    //Write the userEnteredANewCityName Delegate method here:

    //Write the PrepareForSegue Method here
        
}


