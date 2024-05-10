//
//  LoginViewModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/9/24.
//

import Foundation

import Combine

final class LoginViewModel: ViewModelType {
    
    // textfield의 입력값을 받아오는 publisher
    //입력값을 확인하는 publisher
    //확인하여 구독하는 버튼 (색깔 변화)
        
    private let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    private let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$"
    
    struct Input {
        let loginTextField: AnyPublisher<String, Never>
        let passTextField: AnyPublisher<String, Never>
    }
    
    struct Output {
        let validate: AnyPublisher<Bool, Never>
    }
    
    func transform(from input: Input) -> Output {
        
        //이메일 정규식 확인
        let emailValidationPublisher = input.loginTextField
            .print()
            .map { $0.range(of: self.emailRegex, options: .regularExpression) != nil }
            .eraseToAnyPublisher()
        
        //비밀번호 확인
        let passwordValidationPublisher = input.passTextField
            .print()
            .map { $0.range(of: self.passwordRegex, options: .regularExpression) != nil }
            .eraseToAnyPublisher()
        
        //이메일 비밀번호 잘 적었으면 True 반환
        let isFormValidPublisher = Publishers.CombineLatest(emailValidationPublisher, passwordValidationPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
        
        return Output(validate: isFormValidPublisher)
        
    }
    
}
