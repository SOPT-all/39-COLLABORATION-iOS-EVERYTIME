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
        let reviews: ReviewPageData
    }
    
    struct LectureData: Decodable {
        let sectionId: Int
        let courseName: String
        let averageGradePoint: Double
    }
    
    struct KeywordsData: Decodable {
        let keywordId: Int
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
        let gradePoint: Double
        let content: String
        let highlight: HighlightData?
    }
    
    
    struct HighlightData: Decodable {
        
    }
}
