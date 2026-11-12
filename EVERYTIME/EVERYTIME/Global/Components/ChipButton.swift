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
                HStack(spacing: 0) {
                    Text(title)
                        .cap2Style()
                        .foregroundStyle(.neutral800)
                        .padding(.trailing, 6)
                    Text(caption)
                        .body2Style()
                        .foregroundStyle(isSelected ? .primary900 : .neutral700)
                    
                    if isSelected {
                        Button {
                            // clear
                        } label: {
                            Image(.closeMini)
                                .resizable()
                                .frame(width: 14, height: 14)
                        }
                    }
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
                HStack(spacing: 0) {
                    Text("\(title) (\(count))")
                        .cap1Style()
                        .foregroundStyle(isSelected ? Color.neutral50 : Color.neutral800)
                }
                .frame(height: 30)
                .padding(.horizontal, 12)
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
