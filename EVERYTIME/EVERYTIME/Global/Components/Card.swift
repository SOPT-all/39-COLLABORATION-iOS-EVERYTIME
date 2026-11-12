//
//  Card.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct Card: View {
    @Binding var selectedCardID: String?
    
    let id: String
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
    
    private var isSelected: Bool {
        selectedCardID == id
    }
    
    var body: some View {
        Button {
            selectedCardID = isSelected ? nil : id
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
                        
                        HStack(alignment: .center, spacing: 8) {
                            SecondaryButton(size: .red, text: "시간표에 추가")
                            SecondaryButton(size: .md, text: "강의평")
                        }
                        .padding(.top, 2)
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
        }
        .buttonStyle(.plain)
    }
}
