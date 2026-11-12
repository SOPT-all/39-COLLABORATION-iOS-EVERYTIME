//
//  Score.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct Score: View {
    enum ScoreSize {
        case lg
        case sm
    }
    
    let size: ScoreSize
    let rating: Int
    
    var body: some View {
        
        switch size {
        case .sm:
            HStack(spacing: 1) {
                ForEach(0..<5, id: \.self) { index in
                    Image(index < rating ? .starFill : .star)
                }
            }
            
        case .lg:
            HStack(spacing: 1) {
                ForEach(0..<5, id: \.self) { index in
                    Image(index < rating ? .starFill : .star)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                }
            }
        }
    }
}
