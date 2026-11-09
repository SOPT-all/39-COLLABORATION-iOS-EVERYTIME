//
//  Card.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct Card: View {
    @State private var isSelected = false
    let lecture: String
    let professor: String
    let section: String
    let classroom: String
    let grade: Int
    let type: String
    let credit: Int
    let code: String
    let cartCount: Int
    let capacity: Int
    let info: String
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(lecture)
                        .body2Style()
                        .foregroundStyle(.neutral900)
                    
                    Text(professor)
                        .body4Style()
                        .foregroundStyle(.neutral900)
                        .padding(.bottom, 6)
                    
                    Text("\(section) / \(classroom)")
                        .cap1Style()
                        .foregroundStyle(.neutral700)
                    
                    HStack(alignment: .center, spacing: 8) {
                        Text("\(grade)학년")
                        Text(type)
                        Text("\(credit)학점")
                        Text(code)
                    }
                    .cap1Style()
                    .foregroundStyle(.neutral700)
                    
                    if (isSelected) {
                        Text(info)
                            .cap3Style()
                            .foregroundStyle(.primary900)
                            .padding(.top, 2)
                            .transition(.opacity)
                        
                        HStack(alignment: .center, spacing: 8) {
                            SecondaryButton(size: .red, text: "시간표에 추가")
                            SecondaryButton(size: .md, text: "강의평")
                        }
                        .padding(.top, 2)
                        .transition(.opacity)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    VStack(alignment: .trailing, spacing: 2) {
                        ScoreM(score: 5)
                            .padding(.bottom, 2)
                        
                        HStack(spacing: 2) {
                            Text("담은")
                            Text("\(cartCount)")
                        }
                        
                        HStack(spacing: 2) {
                            Text("정원")
                            Text("\(capacity)")
                        }
                    }
                    .cap5Style()
                    .foregroundStyle(.neutral400)
                    .padding(.trailing, 8)
                    
                    StateDot(isFull: true)
                }
                .padding(.top, 4)
            }
            .padding(.vertical, 12)
            .padding(.leading, 24)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity)
            .background(
                isSelected ? .primary100 : .white
            )
            .animation(.easeInOut(duration: 0.25), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    Card(lecture: "국어학입문", professor: "김경아", section: "화3/수3", classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3, code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년")
}
