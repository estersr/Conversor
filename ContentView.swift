//
//  ContentView.swift
//  Conversor
//
//  Created by Esther Ramos on 15/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var chosenInputUnit: UnitTemperature = .celsius
    @State private var chosenOutputUnit: UnitTemperature = .fahrenheit
    let units: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    var convertedOutput: Measurement<UnitTemperature> {
        Measurement(value: Double(userInput) ?? 0, unit: chosenInputUnit).converted(to: chosenOutputUnit)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Digite um valor")) {
                    TextField("Quantidade", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Escolha a unidade de entrada")) {
                    Picker("Entrada", selection: $chosenInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                                .bold()
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Escolha a unidade de saída")) {
                    Picker("Saída", selection: $chosenOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                                .bold()
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("O resultado é \(convertedOutput.value, specifier: "%.2F") \(convertedOutput.unit.symbol)")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.blue)
            }
            .navigationTitle("Conversor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
