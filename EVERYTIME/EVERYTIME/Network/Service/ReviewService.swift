//
//  ReviewService.swift
//  EVERYTIME
//
//  Created by sieon on 11/13/26.
//

import Foundation

final class ReviewService {
    
    enum ReviewsSort: String {
        case latest = "LATEST"
    }
    
    static let shared = ReviewService()
    
    private init() {}
    
    private func makeRequest(
        body: Data? = nil,
        method: String,
        sectionID: Int64,
        keywordID: Int64? = nil,
        queryItems: [URLQueryItem] = []
    ) throws -> URLRequest {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let url = URL(string: baseURL) else {
            throw NetworkError.urlError
        }
        
        let reviewsPath = "/api/v1/sections/\(sectionID)/reviews"
        let path = keywordID.map { "\(reviewsPath)/keywords/\($0)" } ?? reviewsPath
        var endpointURL = url.appending(path: path)
        
        guard var components = URLComponents(
            url: endpointURL,
            resolvingAgainstBaseURL: false
        ) else {
            throw NetworkError.urlError
        }
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let requestURL = components.url else {
            throw NetworkError.urlError
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        request.httpBody = body
        
        if body != nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        return request
    }
    
    func fetchReviews(sectionID: Int64, sort: ReviewsSort? = nil, page: Int?, size: Int?) async throws -> LectureReviewListResponseDTO {
        var queryItems: [URLQueryItem] = []
        
        if let sort {
            queryItems.append(
                URLQueryItem(name: "sort", value: sort.rawValue)
            )
        }
        if let page {
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }
        if let size {
            queryItems.append(URLQueryItem(name: "size", value: "\(size)"))
        }
        
        let request = try makeRequest(method: "GET", sectionID: sectionID, queryItems: queryItems)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(LectureReviewListResponseDTO.self, from: data)
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
