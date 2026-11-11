//
//  TimetableView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/10/26.
//

import SwiftUI

struct TimetableView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(spacing: 6) {
                header
                
                Timetable(
                    lessons: [
                        .init(day: 0, start: 9, end: 11, title: "교내인턴",
                              professor: "", color: .timetableCoral),
                        .init(day: 2, start: 11, end: 13.5, title: "사진디자인",
                              professor: "조형예술", color: .timetableGreen)
                    ],
                    days: ["월", "화", "수", "목", "금"],
                    startHour: 9,
                    endHour: 14
                )
                .padding(.horizontal, 8)
            }
            .padding(.bottom, 14)
            
            VStack(alignment: .leading, spacing: 12) {
                TimetableFilterSection()
                
                TimetableListView()
            }
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
}

#Preview {
    TimetableView()
}
