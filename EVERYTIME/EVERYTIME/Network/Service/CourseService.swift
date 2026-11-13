//
//  CourseService.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/13/26.
//

import Foundation

final class CourseService {
    static let shared = CourseService()
    
    private init() {}
    
    private func makeRequest(
        method: String,
        body: Data? = nil,
        queryItems: [URLQueryItem] = []
    ) throws -> URLRequest {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let url = URL(string: baseURL) else {
            throw NetworkError.urlError
        }
        
        let path = "/api/v1/courses"
        let endpointURL = url.appending(path: path)
        
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
    
    func fetchCourses(query: CourseRequestDTO, memberId: Int64) async throws -> CourseResponseDTO {
        var items: [URLQueryItem] = []
        
        if let value = query.categoryId {
            items.append(.init(name: "categoryId", value: String(value)))
        }
        if let value = query.departmentId {
            items.append(.init(name: "departmentId", value: String(value)))
        }
        if let value = query.semester {
            items.append(.init(name: "semester", value: value))
        }
        if let value = query.hideTaken {
            items.append(.init(name: "hideTaken", value: String(value)))
        }
        if let value = query.hideRestricted {
            items.append(.init(name: "hideRestricted", value: String(value)))
        }
        if let value = query.sort {
            items.append(.init(name: "sort", value: value))
        }
        if let value = query.page {
            items.append(.init(name: "page", value: String(value)))
        }
        if let value = query.size {
            items.append(.init(name: "size", value: String(value)))
        }

        var request = try makeRequest(method: "GET", queryItems: items)
        request.setValue(String(memberId), forHTTPHeaderField: "X-Member-Id")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
        
        let result = try JSONDecoder().decode(CourseResponseDTO.self, from: data)
        guard result.success, result.data != nil else {
            throw NetworkError.serverError(message: result.message)
        }
        return result
    }
}
