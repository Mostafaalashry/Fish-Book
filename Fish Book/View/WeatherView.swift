//
//  WeatherView.swift
//  Fish Book
//
//  Created by mostafa on 29/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherView: View {
    @State private var forecast: ForecastResponse?
        
   
    
    var body: some View {
        NavigationView{
             VStack {
                
                Text("Weather")
                    .font(.system(size: 38,weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(
                        
                        LinearGradient(
                            colors: [.red, Color("Primary Blue")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                if let forecast = forecast {
                    List(forecast.forecast.forecastday, id: \.date) { forecastDay in
                        NavigationLink(destination: DayDetailView(day: forecastDay)) {
                            VStack(alignment: .leading) {
                                HStack{
                                    Text(getDayName(from: forecastDay.date) ?? "")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Primary Blue"))
                                    Text( forecastDay.date)
                                        .fontWeight(.light)
                                    
                                }
                                HStack{
                                    //\(forecastDay.day.condition.icon)
                                    if let iconUrl = URL(string: "https:\(forecastDay.day.condition.icon)") {
                                        WebImage(url: iconUrl)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 64, height: 64)
                                    }
                                    
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        Text(forecastDay.day.condition.text)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(
                                                
                                                LinearGradient(
                                                    colors: [.red, Color("Primary Blue")],
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                        HStack{
                                            Text("Tempreture ")
                                            Text("  \(Int(forecastDay.day.maxtemp_c))°C")
                                            Text(" \(Int(forecastDay.day.mintemp_c))°C")
                                            
                                        }
                                        
                                        //    Text("Average Temp: \(Int(forecastDay.day.avgtemp_c))°C")
                                        Text("Max Wind Speed: \(Int(forecastDay.day.maxwind_kph)) kph")
                                        Text("Humidity: \(forecastDay.day.avghumidity)%")
                                        Text("Rain: \(forecastDay.day.daily_chance_of_rain)%💧")
                                        
                                    }
                                    
                                }
                                
                                
                            }
                         }
                        }
                    
                    
                    
                    } else {
                        Text("Loading...")
                    }
                }
            
            
            .onAppear {
                fetchData()
            }
         
            
        }
   }
    func fetchData() {
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=07431444fb6343e2ba2211457242702&q=Alexandria&days=10&aqi=no&alerts=no") else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else{
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodeRResponse = try? JSONDecoder().decode(ForecastResponse.self, from: data){
                DispatchQueue.main.sync {
                    self.forecast = decodeRResponse
                    
                    print("Data is",data)
           

                }
            }else{
                print("faild to decodeJson")
            }
            
        }.resume()
    }
    
    
    
    
    
  public  func getDayName(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            
            switch dayOfWeek {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}



struct DayDetailView: View {
    let day: ForecastDay
    
    var body: some View {
        let getDay = WeatherView()
        Text(getDay.getDayName(from: day.date) ?? "")
            .font(.largeTitle)
               .foregroundStyle(
                   
                   LinearGradient(
                       colors: [.red, Color("Primary Blue")],
                       startPoint: .leading,
                       endPoint: .trailing
                   )
               )
              
               
        List(day.hour, id: \.time) { hour in
            VStack(alignment: .leading) {
              
                 //   Text(getDayName(from: hour.time) ?? "")
                 //       .fontWeight(.bold)
                 //       .foregroundColor(Color("Primary Blue"))
                //  let w =  hour.time.suffix(5)
                   Text(" Time \(hour.time) ")
                        .fontWeight(.light)
                    
                
                HStack{
                    //\(forecastDay.day.condition.icon)
                    if let iconUrl = URL(string: "https:\(hour.condition.icon)") {
                                               WebImage(url: iconUrl)
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fit)
                                                   .frame(width: 64, height: 64)
                                           }
                        
                       
                    VStack(alignment: .leading, spacing: 8){
                        Text(hour.condition.text)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary Blue"))
                        
                          //  Text("Tempreture ")
                            Text(" Tempreture \(Int(hour.temp_c))°C")
                        
                           

                            Text("Wind: \( String(format:"%.1f", hour.wind_kph)) k")
                            Text("wind direction  \(hour.wind_dir)")
                     
                        
                    //    Text("Average Temp: \(Int(forecastDay.day.avgtemp_c))°C")
                      //  Text("Max Wind Speed: \(Int(forecastDay.day.maxwind_kph)) kph")
                        Text("Humidity: \(hour.humidity)%")
                        Text("Rain: \(hour.chance_of_rain)%💧")
                        Text("Cloud: \(hour.cloud)% ☁️")
                       
                    }
                    
                }
                
              
            }

        }
        
       // .navigationTitle("Hourly Forecast")
    }
}
