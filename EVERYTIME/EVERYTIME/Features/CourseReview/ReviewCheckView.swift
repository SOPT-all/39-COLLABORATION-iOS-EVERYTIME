//
//  ReviewCheckView.swift
//  EVERYTIME
//
//  Created by sieon on 11/10/26.
//

import SwiftUI

struct ReviewCheckView: View {
    private let categories = ["전체", "교수님", "과제", "시험", "팀 프로젝트"]
    @State private var selected = "교수님"
    
    var body: some View {
        ZStack {
            VStack {
                TopBar(title: "AI와창의적문제해결 강의실")
                
                HStack {
                    Text("3.67")
                        .head1Style()
                        .foregroundStyle(.neutral900)
                        .padding(.leading, 22)
                    
                    Score(size: .lg, rating: 4)
                    
                    Spacer()
                    
                    IconRightButton(title: "전체")
                        .padding(.trailing, 4)
                    IconRightButton(title: "등록순")
                        .padding(.trailing, 16)
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach(categories, id: \.self) { category in
                            ChipButton(title: category, style: .sm(count: 1), isSelected: selected == category, action: { selected = category } )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                }
                .scrollIndicators(.hidden)
                
                    
                    CourseReviewView()
            }
            
            VStack(spacing: 0){
                Spacer()
                
                IconLeftButton(title: "평가하기", size: .lg)
                    .padding(.bottom, 8)
                
                Divider()
                NavigationTab()
                    .background(Color.white.ignoresSafeArea(edges: .bottom))
                    .shadow(color: .black.opacity(0.13), radius: 10.5, x: 0, y: 0)
            }
        }
    }
}
