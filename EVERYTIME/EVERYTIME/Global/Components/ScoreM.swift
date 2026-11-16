//
//  ScoreM.swift
//  EVERYTIME
//
//  Created by Seoyoung Lee on 11/8/26.
//

import SwiftUI

struct ScoreM: View {
    let score: Double
    
    var body: some View {
        Image("ScoreM\(Int(score))")
    }
}
