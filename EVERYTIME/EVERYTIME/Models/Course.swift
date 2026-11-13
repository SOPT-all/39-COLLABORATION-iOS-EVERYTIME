//
//  Course.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/13/26.
//

import Foundation

struct Course: Identifiable {
    let id: Int64
    let code: String
    let name: String
    let semester: String
    let credit: Int
    let departmentName: String
    let categoryName: String
    let recommendedGrade: Int?
    let targetGrade: Int?
    let targetText: String?
    let sections: [CourseSection]
}

struct CourseSection: Identifiable {
    let id: Int64
    let number: String
    let professor: String
    let capacity: Int
    let savedCount: Int
    let averageGradePoint: Double
    let schedules: [CourseSchedule]
}

struct CourseSchedule {
    let dayOfWeek: String
    let startTime: String
    let endTime: String
    let classroom: String
}
