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
        let courseCode: String
        let courseName: String
        let semester: String
        let credit: Int
        let departmentId: Int64
        let departmentName: String
        let categoryId: Int64
        let categoryName: String
        let recommendedGrade: Int?
        let targetGrade: Int?
        let targetText: String?
        let sections: [SectionDTO]
    }
    
    struct SectionDTO: Decodable {
        let sectionId: Int64
        let sectionNo: String
        let professor: String
        let capacity: Int?
        let savedCount: Int
        let averageGradePoint: Double
        let times: [TimeDTO]
        let timeText: String
    }
    
    struct TimeDTO: Decodable {
        let dayOfWeek: String
        let startTime: String
        let endTime: String
        let classroom: String?
    }
}

extension CourseResponseDTO.CourseDTO {
    func toDomain() -> Course {
        Course(
            id: courseId,
            code: courseCode,
            name: courseName,
            semester: semester,
            credit: credit,
            departmentName: departmentName,
            categoryName: categoryName,
            recommendedGrade: recommendedGrade,
            targetGrade: targetGrade,
            targetText: targetText,
            sections: sections.map { $0.toDomain() }
        )
    }
}

extension CourseResponseDTO.SectionDTO {
    func toDomain() -> CourseSection {
        CourseSection(
            id: sectionId,
            number: sectionNo,
            professor: professor,
            capacity: capacity,
            savedCount: savedCount,
            averageGradePoint: averageGradePoint,
            schedules: times.map { $0.toDomain() },
            timeText: timeText
        )
    }
}

extension CourseResponseDTO.TimeDTO {
    func toDomain() -> CourseSchedule {
        CourseSchedule(
            dayOfWeek: dayOfWeek,
            startTime: startTime,
            endTime: endTime,
            classroom: classroom
        )
    }
}
