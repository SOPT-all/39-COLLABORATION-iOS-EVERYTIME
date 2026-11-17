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

extension TimetableResponseDTO.TimetableEntryDTO {
    func toDomain() -> TimetableEntry {
        TimetableEntry(
            id: entryId,
            courseName: courseName,
            times: times.map { $0.toDomain() }
        )
    }
}

extension TimetableResponseDTO.TimetableTimeDTO {
    func toDomain() -> TimetableTime {
        TimetableTime(
            dayOfWeek: dayOfWeek,
            startTime: startTime,
            endTime: endTime
        )
    }
}
