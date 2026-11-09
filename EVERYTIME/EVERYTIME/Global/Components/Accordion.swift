//
//  Accordion.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/9/26.
//

import SwiftUI

struct Accordion: View {
    let title: String
    let sectionCount: Int
    let cards: [Card]
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                isExpanded.toggle()
            } label: {
                HStack(alignment: .center, spacing: 2) {
                    Text(title)
                        .foregroundStyle(.neutral900)
                    
                    Text("(총\(sectionCount)분반)")
                        .foregroundStyle(.neutral700)

                    Spacer()

                    HStack(alignment: .center, spacing: 2) {
                        Image(.collapse)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 17, height: 17)
                            .rotationEffect(.degrees(180))
                            
                        Text("펼치기")
                    }
                    .foregroundStyle(.timetableCoral)
                    .opacity(isExpanded ? 0 : 1)
                    .accessibilityHidden(isExpanded)
                }
                .body2Style()
                .padding(.vertical, 13)
                .padding(.horizontal, 24)
                .background(.neutral50)
            }
            .buttonStyle(.plain)

            if isExpanded {
                ForEach(cards.indices, id: \.self) { index in
                    cards[index]
                }

                Button {
                    isExpanded = false
                } label: {
                    HStack(alignment: .center, spacing: 2) {
                        Spacer()
                        
                        Image(.collapse)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 17, height: 17)
                        
                        Text("접기")
                            .body2Style()
                    }
                    .foregroundStyle(.timetableCoral)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(.neutral200)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
