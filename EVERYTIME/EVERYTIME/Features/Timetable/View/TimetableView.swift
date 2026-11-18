//
//  TimetableView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/10/26.
//

import SwiftUI

struct TimetableView: View {
    @State private var courseSearchViewModel = CourseSearchViewModel()
    @State private var timetableViewModel = TimetableViewModel()
    @State private var isTimeFilterPresented = false
    
    private let timetableColors: [Color] = [
        .timetableCoral,
        .timetableOrange,
        .timetableGreen,
        .timetableMint,
        .timetableBlue,
        .timetablePurple,
        .timetableOlive,
        .timetableRose,
        .timetableGray
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(spacing: 6) {
                header
                
                ScrollView {
                    Timetable(
                        lessons: lessons,
                        days: ["월", "화", "수", "목", "금"],
                        startHour: 9,
                        endHour: 20
                    )
                    .padding(.horizontal, 8)
                }
                .frame(height: 220)
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, 14)
            
            VStack(alignment: .leading, spacing: 12) {
                TimetableFilterSection(
                    selectedCategoryId: $courseSearchViewModel.selectedCategoryId,
                    hideTaken: $courseSearchViewModel.hideTaken,
                    hideRestricted: $courseSearchViewModel.hideRestricted,
                    selectedTimeSlots: courseSearchViewModel.selectedTimeSlots,
                    onTimeTap: {
                        isTimeFilterPresented = true
                    },
                    onTimeClear: {
                        courseSearchViewModel.setTimeSlots(slots: [])
                    }
                )
                .onChange(of: courseSearchViewModel.selectedCategoryId) { _, _ in
                    Task {
                        await courseSearchViewModel.applyFilters()
                    }
                }
                .onChange(of: courseSearchViewModel.hideTaken) { _, _ in
                    Task {
                        await courseSearchViewModel.applyFilters()
                    }
                }
                .onChange(of: courseSearchViewModel.hideRestricted) { _, _ in
                    Task {
                        await courseSearchViewModel.applyFilters()
                    }
                }
                
                TimetableListView(courses: courseSearchViewModel.courses) {
                    Task {
                        await courseSearchViewModel.loadNextPage()
                    }
                }
            }
        }
        .task {
            await timetableViewModel.loadTimetable()
            await courseSearchViewModel.loadCourses()
        }
        .navigationDestination(isPresented: $isTimeFilterPresented) {
            TimeFilterView(
                lessons: lessons,
                initialSlots: courseSearchViewModel.selectedTimeSlots
            ) { slots in
                courseSearchViewModel.setTimeSlots(slots: slots)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    private var header: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(.close)
                .resizable()
                .frame(width: 24, height: 24)
            
            Spacer()
            
            SecondaryButton(size: .sm, text: "마법사")
            
            SecondaryButton(size: .sm, text: "직접 추가")
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    private var lessons: [TimetableLesson] {
        timetableViewModel.timetable.flatMap { entry in
            entry.times.compactMap { time -> TimetableLesson? in
                guard
                    let day = dayIndex(time.dayOfWeek),
                    let start = hourValue(time.startTime),
                    let end = hourValue(time.endTime),
                    end > start
                else {
                    return nil
                }
                
                return TimetableLesson(
                    day: day,
                    start: start,
                    end: end,
                    title: entry.courseName,
                    professor: "",
                    color: timetableColors[Int(entry.id % Int64(timetableColors.count))]
                )
            }
        }
    }
    
    private func dayIndex(_ value: String) -> Int? {
        switch value {
        case "MON": return 0
        case "TUE": return 1
        case "WED": return 2
        case "THU": return 3
        case "FRI": return 4
        case "SAT": return 5
        case "SUN": return 6
        default: return nil
        }
    }
    
    private func hourValue(_ value: String) -> Double? {
        let parts = value.split(separator: ":")
        guard parts.count == 3,
              let hour = Int(parts[0]),
              let minute = Int(parts[1]),
              let second = Int(parts[2]),
              (0...23).contains(hour),
              (0...59).contains(minute),
              (0...59).contains(second) else {
            return nil
        }

        return Double(hour) + Double(minute) / 60 + Double(second) / 3600
    }
}

#Preview {
    TimetableView()
}
