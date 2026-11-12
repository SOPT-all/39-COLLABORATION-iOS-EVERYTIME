//
//  ReviewRowView.swift
//  EVERYTIME
//
//  Created by sieon on 11/9/26.
//
import SwiftUI

struct ReviewRowView: View {
    let author: String
    let caption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 6) {
                    Score(size: .sm, rating: 5)
                        .padding(.bottom, 2)
                    
                    Text(author)
                        .cap4Style()
                        .foregroundStyle(.neutral400)
                        .padding(.bottom, 7)
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    IconLeftButton(title: "추천", size: .sm)
                        .padding(.trailing, 4)
                    SecondaryButton2(title: "신고")
                }
                .padding(.bottom, 17)
            }
            
            Text(caption.byCharWrapping)
                .body4Style()
                .foregroundStyle(.neutral800)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
    }
}
