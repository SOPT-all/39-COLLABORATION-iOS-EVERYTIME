//
//  Score.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct Score: View {
    let rating: Int
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<5, id: \.self) { index in
                Image(index < rating ? .starFill : .star)
            }
        }
    }
}
