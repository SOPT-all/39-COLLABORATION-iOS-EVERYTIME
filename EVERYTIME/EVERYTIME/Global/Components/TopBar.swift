//
//  Top:Bar.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct TopBar: View {
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(.back)
            }
            
            Spacer()
            
            Text(title)
                .head1Style()
                
            Spacer()
            
            Image(.close)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 16)
    }
}
