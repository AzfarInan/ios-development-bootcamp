import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=12964f34e8b757ad913d488cf8b2083c&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(_ cityName: String?,_ lat: String?,_ lon: String?) {
        var urlString = ""
        
        if lat != nil && lon != nil {
            urlString = "\(weatherURL)&lat=\(lat!)&lon=\(lon!)"
        } else {
            urlString = "\(weatherURL)&q=\(cityName!)"
        }
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        // 1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give Session a Task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4. Start the Task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let cityName = decodedData.name
            let temperature = decodedData.main.temp
            let weatherId = decodedData.weather[0].id
            
            let weather = WeatherModel(conditionId: weatherId, cityName: cityName, temperature: temperature)
            return weather
            
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
