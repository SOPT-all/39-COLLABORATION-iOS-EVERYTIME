//
//  CourseReview.swift
//  EVERYTIME
//
//  Created by sieon on 11/10/26.
//

import Foundation

struct LectureSummary {
    let sectionId: Int
    let courseName: String
    let averageGradePoint: Int
}

struct ReviewKeyword: Identifiable {
    let id: Int64
    let name: String
    let count: Int
    var title: String { "\(name) (\(count))"}
}

struct ReviewContent: Identifiable {
    let id: Int
    let year: Int
    let gradePoint: Int
    let semester: String
    let content: String
    
    var author: String {
        "\(year % 100)년 \(semester) 수강자"
    }
}

struct ReviewPage {
    let lecture: LectureSummary
    let keywords: [ReviewKeyword]
    let totalReviewCount: Int
    let reviews: [ReviewContent]
    let page: Int
    let hasNext: Bool
}
