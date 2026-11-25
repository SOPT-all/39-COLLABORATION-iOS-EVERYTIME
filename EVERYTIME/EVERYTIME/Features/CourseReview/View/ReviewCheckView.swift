//
//  ReviewCheckView.swift
//  EVERYTIME
//
//  Created by sieon on 11/10/26.
//

import SwiftUI

struct ReviewCheckView: View {
    @State private var viewModel: ReviewCheckViewModel
    
    init(sectionId: Int64) {
        _viewModel = State(initialValue: ReviewCheckViewModel(sectionId: sectionId))
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TopBar(title: viewModel.lecture?.courseName ?? "")
                    .padding(.top, 4)
                    .padding(.bottom, 6)
                
                HStack(spacing: 0) {
                    Text("\(viewModel.lecture?.averageGradePoint ?? 0)")
                        .head1Style()
                        .foregroundStyle(.neutral900)
                        .padding(.trailing, 10)
                        .padding(.leading, 22)
                    
                    Score(size: .lg, rating: viewModel.lecture?.averageGradePoint ?? 0)
                    
                    Spacer()
                    
                    IconRightButton(title: "전체")
                        .padding(.trailing, 4)
                    IconRightButton(title: "등록순")
                        .padding(.trailing, 16)
                }
                .padding(.bottom, 24)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ChipButton(
                            title: "전체",
                            style: .sm(count: viewModel.totalReviewCount),
                            isSelected: viewModel.selectedKeywordId == nil,
                            action: {
                                Task {
                                    await viewModel.selectAll()
                                }
                            }
                        )

                        ForEach(viewModel.keywords) { keyword in
                            ChipButton(
                                title: keyword.name,
                                style: .sm(count: keyword.count),
                                isSelected: keyword.id == viewModel.selectedKeywordId,
                                action: {
                                    Task {
                                        await viewModel.selectKeyword(keyword.id)
                                    }
                                }
                            )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 16)
                .scrollIndicators(.hidden)
                
                CourseReviewView(reviews: viewModel.reviews)
            }
            
            VStack(spacing: 0) {
                Spacer()
                IconLeftButton(title: "평가하기", size: .lg)
                    .padding(.bottom, 8)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            NavigationTab()
                .background(
                    Color.white.ignoresSafeArea(edges: .bottom)
                        .shadow(color: .black.opacity(0.13), radius: 10.5, x: 0, y: 0)
                )
            
        }
        .task {
            await viewModel.loadReviews()
        }
    }
}

#Preview {
    ReviewCheckView(sectionId: 3)
}
