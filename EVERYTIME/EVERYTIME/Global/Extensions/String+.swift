//
//  String+.swift
//  EVERYTIME
//
//  Created by sieon on 11/13/26.
//

import Foundation

extension String {
    var byCharWrapping: Self {
        map(String.init).joined(separator: "\u{200B}")
    }
}
