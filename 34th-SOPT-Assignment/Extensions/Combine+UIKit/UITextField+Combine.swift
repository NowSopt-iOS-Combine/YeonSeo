//
//  UITextField+Combine.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/9/24.
//

import UIKit

import Combine

extension UITextField {
    var myTextPublisher : AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{ $0.object as? UITextField }
            .map{ $0.text ?? "" }
            .print()
            .eraseToAnyPublisher()
    }
}
