//
//  CourseSearchViewModel.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/16/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class CourseSearchViewModel {

    private(set) var courses: [Course] = []
    var selectedTimeSlots: Set<TimeSlot> = []
    
    private var timesQuery: [String]? {
        guard !selectedTimeSlots.isEmpty else { return nil }

        let days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

        return selectedTimeSlots
            .sorted {
                $0.day == $1.day
                    ? $0.hour < $1.hour
                    : $0.day < $1.day
            }
            .map { slot in
                let start = String(format: "%02d:00", slot.hour)
                let end = String(format: "%02d:00", slot.hour + 1)
                return "\(days[slot.day])-\(start)-\(end)"
            }
    }

    private(set) var isLoading = false
    private(set) var isLoadingMore = false
    private(set) var errorMessage: String?

    var selectedCategoryId: Int64?
    var selectedDepartmentId: Int64?
    var hideTaken = false
    var hideRestricted = false
    var semester: String?
    var sort: String?
    private(set) var page = 1
    private(set) var hasNext = false

    func loadCourses() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let response = try await CourseService.shared.fetchCourses(
                query: CourseRequestDTO(
                    categoryId: selectedCategoryId,
                    departmentId: nil,
                    semester: nil,
                    hideTaken: hideTaken,
                    hideRestricted: hideRestricted,
                    times: timesQuery,
                    sort: nil,
                    page: 1,
                    size: 10
                ),
                memberId: 1
            )
            
            courses = response.data?.courses.map { $0.toDomain() } ?? []
            page = response.data?.page ?? 1
            hasNext = response.data?.hasNext ?? false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func loadNextPage() async {
        guard hasNext, !isLoading, !isLoadingMore else { return }

        let nextPage = page + 1
        isLoadingMore = true
        defer { isLoadingMore = false }

        do {
            let response = try await CourseService.shared.fetchCourses(
                query: CourseRequestDTO(
                    categoryId: selectedCategoryId,
                    departmentId: nil,
                    semester: nil,
                    hideTaken: hideTaken,
                    hideRestricted: hideRestricted,
                    times: timesQuery,
                    sort: nil,
                    page: nextPage,
                    size: 10
                ),
                memberId: 1
            )
            guard let data = response.data else { return }

            courses.append(contentsOf: data.courses.map { $0.toDomain() })
            page = data.page
            hasNext = data.hasNext
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func applyFilters() async {
        page = 1
        hasNext = false
        await loadCourses()
    }
    
    func setTimeSlots(slots: Set<TimeSlot>) async {
        guard selectedTimeSlots != slots else { return }
        
        selectedTimeSlots = slots
        await applyFilters()
    }
}
