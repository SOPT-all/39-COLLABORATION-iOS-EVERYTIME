//
//  TimetableListView.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/11/26.
//

import SwiftUI

struct TimetableListView: View {
    @State private var selectedCardID: String?
    
    var body: some View {
        List {
            Card(
                selectedCardID: $selectedCardID,
                id: "1", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Accordion(
                title: "AI와창의적문제해결",
                sectionCount: 3,
                cards: [
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "2", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    ),
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "3", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    ),
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "4", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    )
                ]
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Accordion(
                title: "AI와창의적문제해결",
                sectionCount: 3,
                cards: [
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "5", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    ),
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "6", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    ),
                    Card(
                        selectedCardID: $selectedCardID,
                        id: "7", lecture: "국어학입문", professor: "김경아", section: "화3/수3",
                        classroom: "인문사회관-314 인문사회관-314", grade: 1, type: "전필", credit: 3,
                        code: "KL02003-01", cartCount: 39, capacity: 80, info: "수강대상: [대상] 국어국문학과 전공 1학년"
                    )
                ]
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 0)
    }
}
