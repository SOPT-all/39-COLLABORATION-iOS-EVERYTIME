//
//  SecondaryButton.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct SecondaryButton: View {
    enum ButtonSize {
        case sm
        case md
    }
    
    let size: ButtonSize
    
    var body: some View {
        switch size {
        case .sm:
            Text("버튼")
                .cap2Style()
                .foregroundStyle(.neutral800)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .frame(height: 27)
                .background(.white)
                .overlay {
                    Capsule().stroke(.neutral300, lineWidth: 1)
                }
        case .md:
            Text("버튼")
                .cap2Style()
                .foregroundStyle(.neutral800)
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .frame(height: 30)
                .background(.white)
                .overlay {
                    Capsule().stroke(.neutral300, lineWidth: 1)
                }
        }
    }
}
