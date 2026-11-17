//
//  TimetableViewModel.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/17/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class TimetableViewModel {
    
    private(set) var timetable: [TimetableEntry] = []
    
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    
    func loadTimetable() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let response = try await TimetableService.shared.fetchTimetable(memberId: 1)
            timetable = response.data?.entries.map { $0.toDomain() } ?? []
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
