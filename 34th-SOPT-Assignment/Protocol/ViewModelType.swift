//
//  ViewModelType.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/9/24.
//

import Combine

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    //func transform(from input: Input, cancelBag: CancelBag) -> Output
}
