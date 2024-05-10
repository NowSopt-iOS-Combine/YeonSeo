//
//  UIButton+Combine.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/9/24.
//

import UIKit

import Combine

extension UIButton {
    var isValid: Bool {
        get {
            backgroundColor == .brand
        }
        set {
            backgroundColor = newValue ? .brand : .black
            isEnabled = newValue
            setTitleColor(newValue ? .white : .gray2, for: .normal)
        }
    }
}
