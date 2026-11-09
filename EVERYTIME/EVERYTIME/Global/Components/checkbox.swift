//
//  checkbox.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct checkbox: View {
    @State private var isChecked: Bool = false
    
    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            if isChecked {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.primary900)
                    .overlay {
                        Image(.check)
                    }
            }
            else {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .strokeBorder(.neutral300, lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    checkbox()
}
