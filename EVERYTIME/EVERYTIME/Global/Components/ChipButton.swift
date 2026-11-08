//
//  Button_Chip_SM.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct ChipButton: View {
    enum ButtonSize {
        case md(caption: String)
        case sm(count: Int)
    }
    
    let title: String
    let style: ButtonSize
    let isSelected: Bool
    var action: () -> Void = { }
    
    var body: some View {
        switch style {
        case .md(let caption):
            Button(action: action) {
                HStack {
                    Text(title)
                        .font(.cap2)
                        .foregroundStyle(.neutral800)
                    Text(caption)
                        .font(.body2)
                        .foregroundStyle(isSelected ? .primary900 : .neutral700)
                }
                .padding(.vertical, 9)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(.neutral50)
                )
            }
            
        case .sm(let count):
            Button(action: action) {
                HStack {
                    Text("\(title) (\(count))")
                        .font(.cap1)
                        .foregroundStyle(isSelected ? Color.neutral50 : Color.neutral800)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(
                    Capsule()
                        .foregroundStyle(isSelected ? Color.neutral900 : Color.white)
                        .overlay {
                            Capsule()
                                .stroke(Color.neutral300, lineWidth: 1)
                        }
                )
            }
        }
    }
}

#Preview {
    ChipButton(title: "키워드:", style: .sm(count: 1), isSelected: false)
}
