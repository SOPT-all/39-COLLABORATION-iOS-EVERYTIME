//
//  SecondaryButton.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct SecondaryButton: View {
    enum ButtonStyle {
        case sm
        case md
        case red
    }
    
    let size: ButtonStyle
    let text: String
    
    var body: some View {
        switch size {
        case .sm:
            Text(text)
                .cap2Style()
                .foregroundStyle(.neutral800)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .frame(height: 27)
                .overlay {
                    Capsule().stroke(.neutral300, lineWidth: 1)
                }
        case .md:
            Text(text)
                .cap2Style()
                .foregroundStyle(.neutral800)
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .frame(height: 30)
                .overlay {
                    Capsule().stroke(.neutral300, lineWidth: 1)
                }
        case .red:
            Text(text)
                .cap2Style()
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .frame(height: 27)
                .background {
                    Capsule().fill(.primary900)
                }
        }
    }
}
