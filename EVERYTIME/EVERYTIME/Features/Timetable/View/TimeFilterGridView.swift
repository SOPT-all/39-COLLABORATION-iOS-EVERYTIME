//
//  TimeFilterGridView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/12/26.
//

import SwiftUI

struct TimeSlot: Hashable {
    let day: Int
    let hour: Int
}

struct TimeFilterGridView: View {
    let lessons: [TimetableLesson]
    @Binding var selectedSlots: Set<TimeSlot>

    private let days = ["월", "화", "수", "목", "금", "토", "일"]
    private let hours = Array(8...23)
    private let timeWidth: CGFloat = 44
    private let cellHeight: CGFloat = 36
    private let horizontalInset: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            let gridWidth = geometry.size.width - horizontalInset * 2
            let dayWidth = (gridWidth - timeWidth) / CGFloat(days.count)
            
            ZStack(alignment: .topLeading) {
                grid(dayWidth: dayWidth)
                lessonHighlights(dayWidth: dayWidth)
                    .allowsHitTesting(false)
                selectedHighlights(dayWidth: dayWidth)
                    .allowsHitTesting(false)
            }
            .frame(width: gridWidth, height: cellHeight * 17)
            .clipShape(RoundedRectangle(cornerRadius: 11))
            .overlay {
                RoundedRectangle(cornerRadius: 11)
                    .strokeBorder(.neutral200, lineWidth: 1)
            }
            .padding(.horizontal, horizontalInset)
        }
        .frame(height: cellHeight * 17)
    }

    private func grid(dayWidth: CGFloat) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                cell("", width: timeWidth)

                ForEach(days.indices, id: \.self) { day in
                    Button {
                        let slots = Set(hours.map {
                            TimeSlot(day: day, hour: $0)
                        })
                        toggle(slots)
                    } label: {
                        cell(days[day], width: dayWidth)
                    }
                }
            }

            ForEach(hours, id: \.self) { hour in
                HStack(spacing: 0) {
                    Button {
                        let slots = Set(days.indices.map {
                            TimeSlot(day: $0, hour: hour)
                        })
                        toggle(slots)
                    } label: {
                        cell("\(hour)", width: timeWidth)
                    }

                    ForEach(days.indices, id: \.self) { day in
                        Button {
                            toggle([TimeSlot(day: day, hour: hour)])
                        } label: {
                            cell("", width: dayWidth)
                        }
                        .accessibilityLabel("\(days[day])요일 \(hour)시")
                    }
                }
            }
        }
        .buttonStyle(.plain)
    }

    private func cell(_ title: String, width: CGFloat) -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .overlay {
                    Rectangle()
                        .strokeBorder(.neutral200, lineWidth: 0.5)
                }

            Text(title)
                .cap1Style()
                .foregroundStyle(.neutral800)
        }
        .frame(width: width, height: cellHeight)
        .contentShape(Rectangle())
    }

    private func lessonHighlights(dayWidth: CGFloat) -> some View {
        ZStack(alignment: .topLeading) {
            ForEach(lessons.filter {
                (0..<7).contains($0.day) && $0.end > 8 && $0.start < 24
            }) { lesson in
                let start = max(8, lesson.start)
                let end = min(24, lesson.end)

                Rectangle()
                    .fill(lesson.color.opacity(0.4))
                    .frame(
                        width: dayWidth,
                        height: CGFloat(end - start) * cellHeight
                    )
                    .offset(
                        x: timeWidth + CGFloat(lesson.day) * dayWidth,
                        y: cellHeight + CGFloat(start - 8) * cellHeight
                    )
            }
        }
        .frame(
            width: timeWidth + dayWidth * 7,
            height: cellHeight * 17,
            alignment: .topLeading
        )
    }

    private func selectedHighlights(dayWidth: CGFloat) -> some View {
        ZStack(alignment: .topLeading) {
            ForEach(Array(selectedSlots), id: \.self) { slot in
                Rectangle()
                    .fill(.neutral400)
                    .frame(width: dayWidth, height: cellHeight)
                    .offset(
                        x: timeWidth + CGFloat(slot.day) * dayWidth,
                        y: cellHeight + CGFloat(slot.hour - 8) * cellHeight
                    )
            }
        }
        .frame(
            width: timeWidth + dayWidth * 7,
            height: cellHeight * 17,
            alignment: .topLeading
        )
    }

    private func toggle(_ slots: Set<TimeSlot>) {
        if slots.isSubset(of: selectedSlots) {
            selectedSlots.subtract(slots)
        } else {
            selectedSlots.formUnion(slots)
        }
    }
}
