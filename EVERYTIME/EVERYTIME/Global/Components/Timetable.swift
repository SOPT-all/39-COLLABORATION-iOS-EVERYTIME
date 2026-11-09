//
//  Timetable.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/9/26.
//

import SwiftUI

struct TimetableLesson: Identifiable {
    let id = UUID()
    let day: Int
    let start: Double
    let end: Double
    let title: String
    let professor: String
    let color: Color
}

struct Timetable: View {
    let lessons: [TimetableLesson]
    let days: [String]
    let startHour: Int
    let endHour: Int

    private let timeWidth: CGFloat = 19
    private let headerHeight: CGFloat = 18
    private let hourHeight: CGFloat = 43
    
    private var gridHeight: CGFloat {
        headerHeight + CGFloat(endHour - startHour) * hourHeight
    }

    var body: some View {
        GeometryReader { geometry in
            let dayWidth = (geometry.size.width - timeWidth) / CGFloat(days.count)

            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        cell(width: timeWidth, height: headerHeight)

                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .cap3Style()
                                .foregroundStyle(.timetableRose)
                                .frame(width: dayWidth, height: headerHeight)
                                .background(cellBorder)
                        }
                    }

                    ForEach(startHour..<endHour, id: \.self) { hour in
                        HStack(spacing: 0) {
                            Text("\(hour)")
                                .cap3Style()
                                .foregroundStyle(.timetableRose)
                                .frame(width: timeWidth, height: hourHeight, alignment: .top)
                                .background(cellBorder)

                            ForEach(days.indices, id: \.self) { _ in
                                cell(width: dayWidth, height: hourHeight)
                            }
                        }
                    }
                }

                ForEach(lessons) { lesson in
                    TimetableBlock(lesson: lesson)
                    .frame(
                        width: dayWidth - 4,
                        height: CGFloat(lesson.end - lesson.start) * hourHeight - 4,
                        alignment: .topLeading
                    )
                    .offset(
                        x: timeWidth + CGFloat(lesson.day) * dayWidth + 2,
                        y: headerHeight
                            + CGFloat(lesson.start - Double(startHour)) * hourHeight + 2
                    )
                }
            }
            .frame(width: geometry.size.width, height: gridHeight, alignment: .topLeading)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.neutral200, lineWidth: 1)
            }
        }
        .frame(height: gridHeight)
    }
    
    private var cellBorder: some View {
        Rectangle()
            .fill(.white)
            .overlay(Rectangle().stroke(.neutral200, lineWidth: 1))
    }

    private func cell(width: CGFloat, height: CGFloat) -> some View {
        cellBorder.frame(width: width, height: height)
    }
}
