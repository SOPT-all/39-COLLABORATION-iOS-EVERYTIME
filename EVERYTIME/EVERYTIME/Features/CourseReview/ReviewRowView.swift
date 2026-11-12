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
        VStack(alignment: .leading) {
            HStack {
                Score(size: .sm, rating: 5)
                    .padding(.bottom, 8)
                Spacer()
                
                IconLeftButton(title: "추천", size: .sm)
                SecondaryButton2(title: "신고")
                    .padding(.trailing, 23)
            }
            Text(author)
                .cap4Style()
                .foregroundStyle(.neutral400)
                .padding(.bottom, 7)
            
            Text(caption)
                .body4Style()
                .foregroundStyle(.neutral800)
        }
        .padding(.leading, 23)
    }
}
