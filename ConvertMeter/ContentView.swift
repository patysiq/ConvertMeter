//
//  ContentView.swift
//  ConvertMeter
//
//  Created by PATRICIA S SIQUEIRA on 05/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var initialMeter = ""
    @State private var tipMeter = 3
    @State private var tipInitialMeter = 3
    
    let tipMeters = ["km", "hm", "dam", "m", "dm","cm", "mm"]
    var numberConverter: Double {
        var number = Double(initialMeter) ?? 1
  
        if tipMeter >= tipInitialMeter {
            number = number * pow(10, Double(tipMeter - tipInitialMeter))
        } else {
            number = number / pow(10, Double(tipInitialMeter - tipMeter))
        }
        
        return number
    }
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Conversion value Initial", text: $initialMeter).keyboardType(.decimalPad)
                        Picker("Meter Unit", selection: $tipInitialMeter) {
                            ForEach(0 ..< tipMeters.count) {
                                Text(self.tipMeters[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("What is the unit of measurement conversion?")) {
                    Picker("Meter Unit", selection: $tipMeter) {
                        ForEach(0 ..< tipMeters.count) {
                            Text(self.tipMeters[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(numberConverter, specifier: "%.4f")")
                }
                
            }
            .navigationBarTitle("Conveter Meter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
