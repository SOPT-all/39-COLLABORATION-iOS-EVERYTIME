//
//  NavigationTab.swift
//  EVERYTIME
//
//  Created by sieon on 11/8/26.
//

import SwiftUI

struct NavigationTab: View {
    var body: some View {
        HStack {
            Button {
            } label: {
                VStack {
                    Image(.overview)
                    Text("개요")
                        .cap4Style()
                        .foregroundStyle(.neutral900)
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                VStack {
                    Image(.review)
                    Text("강의평")
                        .cap4Style()
                        .foregroundStyle(.neutral900)
                }
                .padding(.top, 6)
                .padding(.bottom, 5)
                .padding(.horizontal, 13.5)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.primary100)
                )
            }
            
            Spacer()
            
            Button {
    
            } label: {
                VStack {
                    Image(.search)
                    Text("시험정보")
                        .cap4Style()
                        .foregroundStyle(.neutral900)
                }
            }
        }
        .frame(height: 59)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 53.5)
    }
}

#Preview {
    NavigationTab()
}
