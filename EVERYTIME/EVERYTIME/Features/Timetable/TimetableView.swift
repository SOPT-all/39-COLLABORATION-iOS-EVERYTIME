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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 8) {
                        // TODO: 컴포넌트에서 selected일때 x 버튼 추가
                        ChipButton(title: "전공/영역", style: .md(caption: "산업디자인학과"), isSelected: true)
                            .padding(.leading, 16)
                        ChipButton(title: "검색어", style: .md(caption: "없음"), isSelected: false)
                        ChipButton(title: "정렬", style: .md(caption: "기본"), isSelected: false)
                        ChipButton(title: "시간", style: .md(caption: "전체"), isSelected: false)
                        ChipButton(title: "학년", style: .md(caption: "전체"), isSelected: false)
                        ChipButton(title: "구분", style: .md(caption: "전체"), isSelected: false)
                            .padding(.trailing, 16)
                    }
                }
                
                HStack(alignment: .center, spacing: 12) {
                    HStack(spacing: 8) {
                        Checkbox()
                        Text("이수한 강의 숨기기")
                    }
                    
                    HStack(spacing: 8) {
                        Checkbox()
                        Text("수강 제한 강의 숨기기")
                    }
                }
                .cap1Style()
                .foregroundStyle(.neutral900)
                .padding(.horizontal, 20)
                
                List {
                    Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년")
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Accordion(
                        title: "AI와창의적문제해결",
                        sectionCount: 3,
                        cards: [
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"),
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"),
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년")
                        ]
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Accordion(
                        title: "AI와창의적문제해결",
                        sectionCount: 3,
                        cards: [
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"),
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"),
                            Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년")
                        ]
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(.plain)

            }
        }
    }
}

#Preview {
    TimetableView()
}
