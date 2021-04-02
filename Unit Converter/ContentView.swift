//
//  ContentView.swift
//  Unit Converter
//
//  Created by sanmi_personal on 02/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedInputUnit = TemperatureUnit.Celsuis
    @State private var selectedOutputUnit = TemperatureUnit.Fahrenheit
    @State private var userInput : String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value to convert from", text: $userInput)
                        .keyboardType(.decimalPad)
                    TemperatureUnitPickerView(title: "Select input unit",selectedUnit:  $selectedInputUnit)
                }.padding()
                
                Section {
                    TemperatureUnitPickerView(title: "Select output unit",selectedUnit:  $selectedOutputUnit)
                    Text("\(userInput)")
                }.padding()
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
