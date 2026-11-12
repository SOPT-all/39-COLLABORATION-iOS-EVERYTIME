//
//  Top:Bar.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct TopBar: View {
    let title: String
    var body: some View {
        HStack {
            Image(.back)
                
            Spacer()
            
            Text(title)
                .head1Style()
                
            Spacer()
            
            Image(.close)
        }
        .padding(.horizontal, 10)
    }
}
