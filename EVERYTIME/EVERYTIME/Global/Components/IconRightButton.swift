//
//  Button_Icon_Right.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct IconRightButton: View {
    let title: String
    var action: () -> Void = { }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 2) {
                Text(title)
                    .body2Style()
                    .foregroundStyle(.neutral700)
                
                Image(.down)
            }
            .padding(.horizontal, 7)
            .padding(.vertical, 7)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.neutral100)
            )
        }
    }
}
