//
//  ContentView.swift
//  Unit Converter
//
//  Created by sanmi_personal on 02/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedInputTemperatureUnit = TemperatureUnit.Celsuis
    @State private var selectedOutputTemperatureUnit = TemperatureUnit.Fahrenheit
    @State private var userInputtedTemperature : String = "0"
    
    var inputTemperatureInCelsius: Double {
        var temperatureInCelsius: Double
        
        switch selectedInputTemperatureUnit {
        case .Celsuis:
            temperatureInCelsius =  Double(userInputtedTemperature) ?? 0
        case .Fahrenheit:
            if let tempInFahrenheit = Double(userInputtedTemperature) {
                temperatureInCelsius =   Double(tempInFahrenheit - 32) / 1.8
            } else {
                temperatureInCelsius = 0
            }
        case .Kelvin:
            if let tempInKelvin =  Double(userInputtedTemperature) {
                temperatureInCelsius = tempInKelvin - 273.15
            } else {
                temperatureInCelsius = 0
            }
        }
        return temperatureInCelsius
    }
    
    var convertedTemparature : Double {
        let temperatureInCelsius = inputTemperatureInCelsius
        var outputTemperature : Double
        
        switch selectedOutputTemperatureUnit {
        case .Celsuis:
            outputTemperature = temperatureInCelsius
        case .Fahrenheit:
            outputTemperature = (temperatureInCelsius * 1.8) + 32
        case .Kelvin:
            outputTemperature = (temperatureInCelsius + 273.15)
        }
        return outputTemperature
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Unit you want to convert from.")) {
                    TemperatureUnitPickerView(title: "Select input unit",selectedUnit:  $selectedInputTemperatureUnit)
                }
                
                TextField("Value to convert from", text: $userInputtedTemperature)
                    .keyboardType(.decimalPad)
                
                Section(header: Text("Unit you want to convert to.")) {
                    TemperatureUnitPickerView(title: "Select output unit",selectedUnit:  $selectedOutputTemperatureUnit)
                }
                
                Text("\(convertedTemparature , specifier: "%.2f")")
            }
            .navigationBarTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
