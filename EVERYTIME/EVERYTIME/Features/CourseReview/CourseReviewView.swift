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
    let reviews: [ReviewContent]

    var body: some View {
        List(reviews) { review in
            ReviewRowView(author: review.author, caption: review.content)
                .padding(.vertical, 16)
                .listRowInsets(EdgeInsets())
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                .alignmentGuide(.listRowSeparatorTrailing) { $0.width }
        }
        .padding(.horizontal, 8)
        .listStyle(.plain)
        .contentMargins(.bottom, 72, for: .scrollContent)
        .scrollContentBackground(.hidden)
        .background(Color.white)
    }
}
