//
//  TimetableResponseDTO.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/16/26.
//

import Foundation

struct TimetableResponseDTO: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: TimetableDataDTO?
    
    struct TimetableDataDTO: Decodable {
        let entries: [TimetableEntryDTO]
    }
    
    struct TimetableEntryDTO: Decodable {
        let entryId: Int64
        let courseName: String
        let times: [TimetableTimeDTO]
    }
    
    struct TimetableTimeDTO: Decodable {
        let dayOfWeek: String
        let startTime: String
        let endTime: String
    }
}
