//
//  LoginPresenterTests.swift
//  OnlineShopTests
//
//  Created by Teacher on 25.02.2023.
//

import XCTest
@testable import OnlineShop

final class LoginPresenterTests: XCTestCase {
    // 1 - Arrange
    @MainActor
    override func setUp() {
        authorizationService = MockAuthorizationService()
        loginView = MockLoginView()
        confirmSignIn = {}

        presenter = LoginPresenter(
            authorizationService: authorizationService,
            view: loginView,
            confirmSignIn: confirmSignIn
        )
    }

    var authorizationService: MockAuthorizationService!
    var loginView: MockLoginView!
    var confirmSignIn: () -> Void = {}

    var presenter: LoginPresenter!

    func testShowLoaderIsCalled() async {
        // 2 - Act
        await presenter.logIn(login: "123", password: "123")

        // 3 - Assert
        let result = await loginView.showLoaderIsCalled
        XCTAssertTrue(result)
    }

    func testLogInIsCalled() async {
        await presenter.logIn(login: "123", password: "456")

        let (login, password) = authorizationService.signedInCredentials ?? ("", "")

        XCTAssertEqual(login, "123")
        XCTAssertEqual(password, "456")
    }
    
    func testHideLoaderIsCalled() async {
        await presenter.logIn(login: "admin", password: "qwerty")

        let result = await loginView.hideLoaderIsCalled
        XCTAssertTrue(result)
    }
    
    func testShowErrorIsCalled() async {
        await presenter.logIn(login: "123", password: "qwerty")

        let result = await loginView.errorShown
        XCTAssertEqual(result as? AuthorizationError, AuthorizationError.unauthorized)
    }

    func testConfirmSignInIsCorrect() async {
        await authorizationService.confirmSignIn()
        let result = authorizationService.getIsAuthorized()
        let expected = true
        XCTAssertEqual(expected, result)
    }
    
    func testSignOutIsCorrect() async {
        authorizationService.signOut()
        let result = authorizationService.getIsAuthorized()
        let expected = false
        XCTAssertEqual(expected, result)
    }
}
