//
//  CourseResponseDTO.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/13/26.
//

import Foundation

struct CourseResponseDTO: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: CourseDataDTO?
    
    struct CourseDataDTO: Decodable {
        let courses: [CourseDTO]
        let page: Int
        let size: Int
        let totalElements: Int64
        let totalPages: Int
        let hasNext: Bool
    }
    
    struct CourseDTO: Decodable {
        let courseId: Int64
        let couseCode: String
        let courseName: String
        let semester: String
        let credit: Int
        let departmentId: Int64
        let departmentName: Int64
        let categoryId: Int64
        let categoryName: Int64
        let recommendedGrade: Int?
        let targetGrade: Int?
        let targetText: String?
        let sections: [SectionDTO]
    }
    
    struct SectionDTO: Decodable {
        let sectionId: Int64
        let sectionNo: String
        let professor: String
        let capacity: Int
        let savedCount: Int
        let averageGradePoint: Double
        let times: [TimeDTO]
    }
    
    struct TimeDTO: Decodable {
        let dayOfWeek: String
        let startTime: String
        let endTime: String
        let classroom: String
    }
}
