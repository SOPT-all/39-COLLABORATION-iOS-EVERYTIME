//
//  PrimaryButton.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/9/26.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    
    var body: some View {
        Text(text)
            .body3Style()
            .foregroundStyle(.white)
            .padding(.horizontal, 13)
            .padding(.vertical, 7)
            .frame(height: 31)
            .background {
                Capsule()
                    .fill(.primary900)
            }
    }
}
