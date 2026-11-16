//
//  TimetableService.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/16/26.
//

import Foundation

final class TimetableService {
    static let shared = TimetableService()
    
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
        
        let path = "/api/v1/timetable"
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
    
    func fetchTimetable(memberId: Int64) async throws -> TimetableResponseDTO {
        var request = try makeRequest(method: "GET")
        request.setValue(String(memberId), forHTTPHeaderField: "X-Member-Id")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
        
        let result = try JSONDecoder().decode(TimetableResponseDTO.self, from: data)
        guard result.success, result.data != nil else {
            throw NetworkError.serverError(message: result.message)
        }
        return result
    }
}
