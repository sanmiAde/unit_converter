//
//  UnitPickerView.swift
//  Unit Converter
//
//  Created by sanmi_personal on 02/04/2021.
//

import SwiftUI

struct TemperatureUnitPickerView: View {
    
     var title: String
    @Binding  var selectedUnit: TemperatureUnit
    
    var body: some View {
        Picker(title, selection: $selectedUnit) {
            ForEach(TemperatureUnit.allCases, id: \.self) { value in
                Text(value.rawValue)
            }
            
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitPickerView_Previews: PreviewProvider {
    
    @State static var selectedUnit : TemperatureUnit = TemperatureUnit.Celsuis
    
    static var previews: some View {
        TemperatureUnitPickerView(title: "Input Unit",selectedUnit: $selectedUnit)
    }
}
