//
//  CourseReviewViewModel.swift
//  EVERYTIME
//
//  Created by sieon on 11/10/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class ReviewCheckViewModel {
    private(set) var lecture: LectureSummary?
    private(set) var keywords: [ReviewKeyword] = []
    private(set) var totalReviewCount = 0
    private(set) var reviews: [ReviewContent] = []
    
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    
    private(set) var page = 1
    private(set) var hasNext = false
    private(set) var selectedKeywordId: Int64?
    
    private let sectionId: Int64
    private let pageSize = 10
    
    
    init(sectionId: Int64) {
        self.sectionId = sectionId
    }
    
    func loadReviews() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let response = try await ReviewService.shared.fetchReviews(
                sectionID: sectionId,
                keywordID: selectedKeywordId,
                sort: .latest,
                page: page,
                size: pageSize
            )
            guard let result = response.data?.toDomain() else {
                errorMessage = response.message
                return
            }
            
            lecture = result.lecture
            keywords = result.keywords
            totalReviewCount = result.totalReviewCount
            reviews = result.reviews
            page = result.page
            hasNext = result.hasNext
        } catch {
            errorMessage = "강의평을 불러오지 못했습니다."
            print(error)
        }
    }
    
    func selectKeyword(_ id: Int64?) async {
        selectedKeywordId = (selectedKeywordId == id) ? nil : id
        page = 1
        await loadReviews()
    }
}
