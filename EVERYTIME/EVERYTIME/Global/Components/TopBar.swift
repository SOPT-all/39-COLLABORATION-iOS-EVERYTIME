//
//  Top:Bar.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack {
            Image(.back)
                .padding(.trailing, 128)
            
            Text("검색")
                .head1Style()
                .padding(.trailing, 128)
            
            Image(.close)
        }
    }
}
