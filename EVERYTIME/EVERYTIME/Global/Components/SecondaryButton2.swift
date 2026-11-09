//
//  Secondary_Button_2.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct SecondaryButton2: View {
    let title: String
    
    var body: some View {
        Button {
            
        } label: {
            Text("버튼")
                .cap4Style()
                .foregroundStyle(.neutral400)
        }
        .padding(.horizontal, 9.5)
        .padding(.vertical, 5)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(.neutral50)
        )
    }
}
