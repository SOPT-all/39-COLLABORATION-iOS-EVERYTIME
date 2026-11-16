//
//  TimetableListView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/11/26.
//

import SwiftUI

struct TimetableListView: View {
    let courses: [Course]
    @State private var selectedCardID: String?
    
    var body: some View {
        List {
            ForEach(courses) { course in
                Accordion(
                    title: course.name,
                    sectionCount: course.sections.count,
                    cards: course.sections.map { section in
                        Card(
                            selectedCardID: $selectedCardID,
                            id: String(section.id),
                            lecture: course.name,
                            professor: section.professor,
                            timeText: section.timeText,
                            grade: course.recommendedGrade ?? 0,
                            type: course.categoryName,
                            credit: course.credit,
                            code: "\(course.code)-\(section.number)",
                            cartCount: section.savedCount,
                            capacity: section.capacity ?? 0,
                            info: course.targetText ?? "",
                            averageGradePoint: section.averageGradePoint
                        )
                    }
                )
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 0)
    }
}
