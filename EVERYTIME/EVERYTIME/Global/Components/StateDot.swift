//
//  State:Dot.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct StateDot: View {
    let isFull: Bool
    
    var body: some View {
        Image(isFull ? "dot-green" : "dot-orange")
    }
}

#Preview {
    VStack {
            StateDot(isFull: true)
            StateDot(isFull: false)
        }
}
