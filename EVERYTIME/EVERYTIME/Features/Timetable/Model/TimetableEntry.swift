//
//  TimetableEntry.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/16/26.
//

import Foundation

struct TimetableEntry: Identifiable {
    let id: Int64
    let courseName: String
    let times: [TimetableTime]
}

struct TimetableTime {
    let dayOfWeek: String
    let startTime: String
    let endTime: String
}
