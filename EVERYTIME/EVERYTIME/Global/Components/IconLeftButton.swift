//
//  IconLeftButton.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct IconLeftButton: View {
    enum ButtonSize{
        case lg
        case sm
    }
    
    let title: String
    let action: () -> Void = { }
    let size: ButtonSize
    
    var body: some View {
        switch size {
            
        case .lg:
            Button (action: action) {
                HStack(spacing: 3.5) {
                    Image(.edit)
                    Text(title)
                        .font(.body2)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(
                    Capsule()
                        .fill(Color.primary900)
                )
            }
            
        case .sm:
            Button(action: action) {
                HStack(spacing: 3.5) {
                    Image(.like)
                    Text(title)
                        .foregroundStyle(.neutral400)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(.neutral50)
                )
            }
        }
    }
}



#Preview {
    IconLeftButton(title: "버튼", size: .sm)
}
