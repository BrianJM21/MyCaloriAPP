//
//  MyCaloriAPPTests.swift
//  MyCaloriAPPTests
//
//  Created by User on 19/01/23.
//

import XCTest
import Combine
@testable import MyCaloriAPP

final class MyCaloriAPPTests: XCTestCase {

    var verifyEmailAlredySignedUpSubscriber: AnyCancellable?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testUserServiceVerifyEmail() {
                
        let testExpectation = expectation(description: "Se verifica si el correo existe en FireBase")
        
        let userService = UserService()
        
        verifyEmailAlredySignedUpSubscriber = userService.verifyEmailAlredySignedUpSubject.sink { completion in
            print(completion)
        } receiveValue: { email in
            print(email)
            testExpectation.fulfill()
        }
        
        userService.loadCoreDataUsers()
        
        userService.verifyEmailAlredySignedUp("prueba")
        userService.verifyEmailAlredySignedUp("prueba@gmail.com")
        userService.verifyEmailAlredySignedUp("prueba@hotmail.com")

        
        wait(for: [testExpectation], timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
