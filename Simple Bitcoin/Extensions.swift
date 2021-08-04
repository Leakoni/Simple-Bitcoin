//
//  Extensions.swift
//  Simple Bitcoin
//
//  Created by Dovydas Bumblauskas on 2021-08-04.
//

import Foundation

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
