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
                        .font(.cap4)
                        .foregroundStyle(.neutral900)
                }
            }
            
            Spacer()
            
            Button {
                
            } label: {
                VStack {
                    Image(.review)
                    Text("강의평")
                        .font(.cap4)
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
                        .font(.cap4)
                        .foregroundStyle(.neutral900)
                }
            }
        }
        .padding(.horizontal, 53.5)
    }
}

#Preview {
    NavigationTab()
}
