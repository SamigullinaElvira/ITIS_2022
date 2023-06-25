//
//  FightingSimulator2999UITests.swift
//  FightingSimulator2999UITests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest

final class FightingSimulator2999UITests: XCTestCase {
    // 10 basic ударов по врагу уменьшит наше hp на 100, hp врага на 90. мы проиграем и откроется экран результата
    func testTenBasicAttacks() throws {
        let app = XCUIApplication()
        app.launch()

        let basicAttackButton = app.buttons["Basic attack"].firstMatch

        for _ in 1...10 {
            basicAttackButton.tap()
        }

        let restartButton = app.buttons["Restart"].firstMatch
        _ = restartButton.waitForExistence(timeout: 3)
        XCTAssertTrue(restartButton.exists)
    }
}
