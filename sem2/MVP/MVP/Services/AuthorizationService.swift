//
//  AuthorizationService.swift
//  MVP
//
//  Created by Эльвира Самигуллина on 11.02.2023.
//

import Foundation
import Combine

enum AuthorizationError {
    case unautorizated
}

protocol AuthorizationService {
//    var authChanged: (Bool) -> Void
    var isAuthorizated: AnyPublisher<Bool, Never> { get }
    
    func signIn(login: String, password: String) async throws
}


class MockAutorizationService: AuthorizationService {
    private var _isAuthorizated: CurrentValueSubject<Bool, Never> = .init(false)
    
    var isAuthorizated: AnyPublisher<Bool, Never> { // publisher - тот, кто отсылает обновления
        _isAuthorizated.eraseToAnyPublisher() // это затирает тип, теперь превращается в
    }
    
    func signIn(login: String, password: String) async throws {
        if !(login == "admin" && password == "qwerty") {
            _isAuthorizated.value = false
            throw AuthorizationError.unautorizated
        } else {
            _isAuthorizated.value = true
        }
    }
}
