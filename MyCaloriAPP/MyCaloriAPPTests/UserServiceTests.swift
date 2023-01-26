//
//  UserServiceTests.swift
//  MyCaloriAPPTests
//
//  Created by User on 26/01/23.
//

import XCTest
import Combine
@testable import MyCaloriAPP

final class UserServiceTests: XCTestCase {
        
    let userService = UserService()
    
    var loadCoreDataUsersSubscriber: AnyCancellable?
    var verifyEmailAlredySignedUpSubscriber: AnyCancellable?

    func testLoadCoreDataUsers() {
        
        let testUserService = UserService()
        
        XCTAssertNotNil(testUserService)
    }
    
    func testUserServiceVerifyEmail() {
                
        let testExpectation = expectation(description: "Se verifica si el correo existe en FireBase")
                
        self.verifyEmailAlredySignedUpSubscriber = self.userService.verifyEmailAlredySignedUpSubject.sink( receiveValue: {
            
            response in
            
            if let error = response.error {
                
                print(error)
            }
            
            if let email = response.email {
                
                print(email)
                testExpectation.fulfill()
            }
        })
                
        self.userService.verifyEmailAlredySignedUp("error")
        self.userService.verifyEmailAlredySignedUp("error@error.com")
        self.userService.verifyEmailAlredySignedUp("prueba@hotmail.com")

        wait(for: [testExpectation], timeout: 10)
    }
    
}
