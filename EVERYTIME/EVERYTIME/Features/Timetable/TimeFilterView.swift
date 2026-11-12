//
//  TimeFilterView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/12/26.
//

import SwiftUI

struct TimeFilterView: View {
    @State private var selectedSlots: Set<TimeSlot> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            
            Text("선택한 시간 내에 개설된 과목만 검색합니다.\n요일 혹은 시간을 누르면 일괄 선택할 수 있습니다.")
                .cap1Style()
                .foregroundStyle(.neutral400)
                .padding(.top, 14)
                .padding(.bottom, 17)
                .padding(.horizontal, 24)
            
            Spacer()
        }
    }
    
    private var header: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(.close)
                .resizable()
                .frame(width: 24, height: 24)
            
            Spacer()
            
            Text("시간")
                .head1Style()
                .foregroundStyle(.neutral900)
                .padding(.leading, 21)
            
            Spacer()
            
            PrimaryButton(text: "적용")
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }
}

#Preview {
    TimeFilterView()
}
