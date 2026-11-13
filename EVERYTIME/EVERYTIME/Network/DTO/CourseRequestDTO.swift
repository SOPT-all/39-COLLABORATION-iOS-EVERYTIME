//
//  CourseRequestDTO.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/13/26.
//

import Foundation

struct CourseRequestDTO: Encodable {
    let categoryId: Int64?
    let departmentId: Int64?
    let semester: String?
    let hideTaken: Bool?
    let hideRestricted: Bool?
    let sort: String?
    let page: Int?
    let size: Int?
}
