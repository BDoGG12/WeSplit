//
//  LoopView.swift
//  WeSplit
//
//  Created by Ben Do on 11/23/25.
//

import SwiftUI

struct LoopView: View {
    var body: some View {
        Form {
//            ForEach(0..<100) { number in
//                Text("Row \(number)")
//            }
            ForEach(0..<100) {
                Text("Row \($0)")
            }
        }
    }
}

#Preview {
    LoopView()
}
