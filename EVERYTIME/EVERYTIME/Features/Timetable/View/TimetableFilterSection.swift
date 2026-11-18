//
//  TimetableFilterSection.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/11/26.
//

import SwiftUI

struct TimetableFilterSection: View {
    @Binding var selectedCategoryId: Int64?
    @Binding var hideTaken: Bool
    @Binding var hideRestricted: Bool
    let selectedTimeSlots: Set<TimeSlot>
    let onTimeTap: () -> Void
    let onTimeClear: () -> Void
    
    let categories: [(id: Int64, name: String)] = [
        (1, "전공필수"),
        (2, "전공선택"),
        (3, "공통교양"),
        (4, "핵심교양"),
        (5, "일반교양")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 8) {
                ChipButton(
                    title: "전공/영역",
                    style: .md(caption: selectedCategoryName),
                    isSelected: selectedCategoryId != nil,
                    clearAction: {
                        selectedCategoryId = nil
                    },
                    menuItems: categories.map { category in
                        (
                            title: category.name,
                            action: { selectedCategoryId = category.id }
                        )
                    }
                )
                .padding(.leading, 16)
                
                ChipButton(title: "검색어", style: .md(caption: "없음"), isSelected: false)
                ChipButton(title: "정렬", style: .md(caption: "기본"), isSelected: false)
                
                ChipButton(
                    title: "시간",
                    style: .md(caption: timeCaption),
                    isSelected: !selectedTimeSlots.isEmpty,
                    action: onTimeTap,
                    clearAction: onTimeClear
                )
                
                ChipButton(title: "학년", style: .md(caption: "전체"), isSelected: false)
                ChipButton(title: "구분", style: .md(caption: "전체"), isSelected: false)
                    .padding(.trailing, 16)
            }
        }
        
        HStack(alignment: .center, spacing: 12) {
            HStack(spacing: 8) {
                Checkbox(isChecked: $hideTaken)
                Text("이수한 강의 숨기기")
            }
            
            HStack(spacing: 8) {
                Checkbox(isChecked: $hideRestricted)
                Text("수강 제한 강의 숨기기")
            }
        }
        .cap1Style()
        .foregroundStyle(.neutral900)
        .padding(.horizontal, 20)
    }
    
    
    @State private var showingCategories = false
    private var selectedCategoryName: String {
        guard let id = selectedCategoryId else { return "없음" }
        return categories.first { $0.id == id }?.name ?? "없음"
    }
    
    private var timeCaption: String {
        guard !selectedTimeSlots.isEmpty else { return "전체" }
        
        let days = ["월", "화", "수", "목", "금", "토", "일"]
        let slots = selectedTimeSlots.sorted {
            $0.day == $1.day
                ? $0.hour < $1.hour
                : $0.day < $1.day
        }
        
        var captions: [String] = []
        var day = slots[0].day
        var start = slots[0].hour
        var end = start + 1
        
        for slot in slots.dropFirst() {
            if slot.day == day && slot.hour == end {
                end += 1
            } else {
                captions.append("\(days[day]), \(start)~\(end)시")
                day = slot.day
                start = slot.hour
                end = start + 1
            }
        }

        captions.append("\(days[day]), \(start)~\(end)시")
        return captions.joined(separator: ", ")
    }
}
