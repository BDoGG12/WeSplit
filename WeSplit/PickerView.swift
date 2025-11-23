//
//  PickerView.swift
//  WeSplit
//
//  Created by Ben Do on 11/23/25.
//

import SwiftUI

struct PickerView: View {
    let students = ["Harry", "Ron", "Hermione"]
    @State private var selectedStudent: String = "Harry"
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { student in
                        Text(student)
                    }
                }
            }
        }
    }
}

#Preview {
    PickerView()
}
