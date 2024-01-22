//
//  CVSCodeChallengUITests.swift
//  CVSCodeChallengUITests
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import XCTest

final class CVSCodeChallengUITests: XCTestCase {
    
    var app: XCUIApplication?
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app?.launchArguments.append("--uitesting")
        app?.launch()
        
        // Set the device orientation to portrait
        XCUIDevice.shared.orientation = .portrait
    }
    
    override func tearDown(){
        // Reset device orientation after the test
        app = nil
        XCUIDevice.shared.orientation = .portrait
    }
}
