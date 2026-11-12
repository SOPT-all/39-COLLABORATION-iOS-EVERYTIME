//
//  TimetableFilterSection.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/11/26.
//

import SwiftUI

struct TimetableFilterSection: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 8) {
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
    }
}
