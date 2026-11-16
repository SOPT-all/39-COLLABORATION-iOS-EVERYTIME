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
    
    @State private var showingCategories = false
    private var selectedCategoryName: String {
        guard let id = selectedCategoryId else { return "없음" }
        return categories.first { $0.id == id }?.name ?? "없음"
    }
    
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
                ChipButton(title: "시간", style: .md(caption: "전체"), isSelected: false)
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
}
