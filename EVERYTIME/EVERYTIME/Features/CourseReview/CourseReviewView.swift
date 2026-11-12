//
//  CourseReviewView.swift
//  EVERYTIME
//
//  Created by sieon on 11/10/26.
//

import SwiftUI

struct Review: Identifiable {
    let id = UUID()
    let author: String
    let caption: String
}

struct CourseReviewView: View {
    private let reviews: [Review] = [
        Review(author: "26년 2학기 전시언", caption: "아 수업 진짜 재밌더라 꼭 들어라(니도당해봐)"),
        Review(author: "이서영", caption: "이거는요, 시험이 진짜 쉬워요(니도 당해봐)"),
        Review(author: "모범생", caption: "교수님의 수업을 들으니 저의 CS 지식이 폭넓게 성장해가네요. 꼭 들으세요!"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ"),
        Review(author: "금쪽이", caption: "전 자서 잘모르겠는데 +는 주더라구요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ")
    ]
    
    var body: some View {
        List(reviews) { review in
            ReviewRowView(author: review.author, caption: review.caption)
                .padding(.vertical, 16)
                .listRowInsets(EdgeInsets())
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                .alignmentGuide(.listRowSeparatorTrailing) { $0.width }
        }
        .padding(.horizontal, 8)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)          
        .background(Color.white)
    }
}
