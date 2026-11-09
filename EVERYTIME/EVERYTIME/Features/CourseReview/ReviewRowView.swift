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
                Score(rating: 5)
                    .padding(.bottom, 8)
                Spacer()
                
                IconLeftButton(title: "추천", size: .sm)
                SecondaryButton2(title: "신고")
                    .padding(.trailing, 23)
            }
            Text("author")
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

#Preview {
    ReviewRowView(author: "26년 2학기 수강자", caption: "교수님께서 좋으셔서 듣기 좋았어요! \n 물론 풀강을.. 하시지만 안하실때도 있기도 하고 너무 친절하게 알려주셔서 만족했습니다!")
}
