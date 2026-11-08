//
//  View+.swift
//  EVERYTIME
//
//  Created by sieon on 11/7/26.
//

import SwiftUI

extension View {
    func head1Style() -> some View {
        self
            .font(.head1)
    }
    
    func subhead1Style() -> some View {
        self
            .font(.subhead1)
    }
    
    func subhead2Style() -> some View {
        self
            .font(.subhead2)
    }
    
    func body1Style() -> some View {
        self
            .font(.body1)
    }
    
    func body2Style() -> some View {
        self
            .font(.body2)
            .tracking(-0.56)
    }
    
    func body3Style() -> some View {
        self
            .font(.body3)
            .tracking(-0.56)
    }
    
    func body4Style() -> some View {
        self
            .font(.body4)
            .tracking(-0.56)
    }
    
    func body5Style() -> some View {
        self
            .font(.body5)
    }
    
    func cap1Style() -> some View {
        self
            .font(.cap1)
            .tracking(-0.24)
    }
    
    func cap2Style() -> some View {
        self
            .font(.cap2)
            .tracking(-0.22)
    }
    
    func cap3Style() -> some View {
        self
            .font(.cap3)
    }
    
    func cap4Style() -> some View {
        self
            .font(.cap4)
    }
    
    func cap5Style() -> some View {
        self
            .font(.cap5)
    }
}
