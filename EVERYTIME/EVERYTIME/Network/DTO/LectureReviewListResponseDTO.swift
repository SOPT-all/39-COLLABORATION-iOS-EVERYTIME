//
//  LectureReviewListResponseDTO.swift
//  EVERYTIME
//
//  Created by sieon on 11/13/26.
//

import Foundation

struct LectureReviewListResponseDTO: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: ReviewData?
    
    struct ReviewData: Decodable {
        let lecture: LectureData
        let keywords: [KeywordsData]
        let totalReviewCount: Int
        let reviews: ReviewPageData
    }
    
    struct LectureData: Decodable {
        let sectionId: Int
        let courseName: String
        let averageGradePoint: Int
    }
    
    struct KeywordsData: Decodable {
        let keywordId: Int64
        let name: String
        let count: Int
    }
    
    struct ReviewPageData: Decodable {
        let content: [ContentData]
        let page: Int
        let size: Int
        let totalElements: Int
        let totalPages: Int
        let hasNext: Bool
    }
    
    struct ContentData: Decodable {
        let reviewId: Int
        let year: Int
        let semester: String
        let gradePoint: Int
        let content: String
        let highlight: HighlightData?
    }
    
    struct HighlightData: Decodable {
        
    }
}

extension LectureReviewListResponseDTO.ContentData {
    func toDomain() -> ReviewContent {
        ReviewContent(id: reviewId, year: year, gradePoint: gradePoint, semester: semester, content: content)
    }
}

extension LectureReviewListResponseDTO.KeywordsData {
    func toDomain() -> ReviewKeyword {
        ReviewKeyword(id: keywordId, name: name, count: count)
    }
}

extension LectureReviewListResponseDTO.LectureData{
    func toDomain() -> LectureSummary {
        LectureSummary(sectionId: sectionId, courseName: courseName, averageGradePoint: averageGradePoint)
    }
}

extension LectureReviewListResponseDTO.ReviewData {
    func toDomain() -> ReviewPage {
        ReviewPage(
            lecture: lecture.toDomain(),
            keywords: keywords.map { $0.toDomain()},
            totalReviewCount: totalReviewCount,
            reviews: reviews.content.map { $0.toDomain()},
            page: reviews.page,
            hasNext: reviews.hasNext
        )
    }
}


