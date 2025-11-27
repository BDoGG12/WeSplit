//
//  ContentView.swift
//  WeSplit
//
//  Created by Ben Do on 11/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var selectZeroTip = false
    var totalPerPerson: Double {
        // calculate the total per person
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    var totalAmount: Double {
        // Original check amount + tip
        let checkAmount = checkAmount
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let overallTotal = checkAmount + tipValue
        
        return overallTotal
    }
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    // Picker for the number of people
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("How much would you like to tip?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) { tipPercentage in
                            Text("\(tipPercentage)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    .onChange(of: tipPercentage, toggleSelectZeroTip)
                    
                }
                
                Section("Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                
                Section("Total Check Amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(selectZeroTip ? Color.red : .primary)
                }
            }
            .navigationTitle(Text("WeSplit"))
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
    
    func toggleSelectZeroTip() {
        if self.tipPercentage == 0 {
            self.selectZeroTip = true
        } else {
            self.selectZeroTip = false
        }
    }
}

#Preview {
    ContentView()
}
