//
//  TimetableBlock.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/9/26.
//

import SwiftUI

struct TimetableBlock: View {
    let lesson: TimetableLesson
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(lesson.title)
                .body5Style()
            Text(lesson.professor)
                .cap5Style()
        }
        .foregroundStyle(.white)
        .padding(4)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(lesson.color)
    }
}
