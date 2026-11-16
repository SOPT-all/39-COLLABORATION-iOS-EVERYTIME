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

    private(set) var isLoading = false
    private(set) var isLoadingMore = false
    private(set) var errorMessage: String?

    var selectedCategoryId: Int64?
    var selectedDepartmentId: Int64?
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
                    categoryId: nil,
                    departmentId: nil,
                    semester: nil,
                    hideTaken: nil,
                    hideRestricted: nil,
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
}
