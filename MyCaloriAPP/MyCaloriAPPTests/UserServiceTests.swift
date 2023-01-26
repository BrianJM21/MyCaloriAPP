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
    var signUpEmailAndPasswordSubscriber: AnyCancellable?
    var signUpUserProfileSubscriber: AnyCancellable?

    func testLoadCoreDataUsers() {
        
        let testExpectation = expectation(description: "Se inicializa el contenedor persistente y se carga el contexto del UserEntity correctamente")
        
        self.loadCoreDataUsersSubscriber = self.userService.loadCoreDataUsersSubject.sink( receiveValue: {
            
            response in
            
            if let error = response.error {
                
                print(error.rawValue)
            }
            
            if let users = response.users {
                
                print(users.first ?? [])
                testExpectation.fulfill()
            }
        })
        
        self.userService.loadCoreDataUsers()
        
        waitForExpectations(timeout: 10)
    }
    
    func testverifyEmailAlredySignedUp() {
                
        let testExpectation = expectation(description: "Se verifica si el correo existe en FireBase")
                
        self.verifyEmailAlredySignedUpSubscriber = self.userService.verifyEmailAlredySignedUpSubject.sink( receiveValue: {
            
            response in
            
            if let error = response.error {
                
                print(error.rawValue)
            }
            
            if let email = response.email {
                
                print(email)
                testExpectation.fulfill()
            }
        })
                
        self.userService.verifyEmailAlredySignedUp("error")
        self.userService.verifyEmailAlredySignedUp("error@error.com")
        self.userService.verifyEmailAlredySignedUp("prueba@hotmail.com")

        waitForExpectations(timeout: 10)
    }
    
    func testSignUp() {
        
        let testExpectation1 = expectation(description: "Se da de alta correo electrónico y contraseña en FireBase")
        let testExpectation2 = expectation(description: "Se da de alta perfil de usuario en CoreData")
        
        self.signUpEmailAndPasswordSubscriber = self.userService.signUpEmailAndPasswordSubject.sink( receiveValue: {
            
            response in
            
            if let error = response.error {
                
                print(error.rawValue)
            }
            
            if let user = response.user {
                
                testExpectation1.fulfill()
                print(user)
                self.userService.signUpUserProfile(userId: user.uid, name: "Test Name", lastName: "Test LastName", userEmail: user.email, userPassword: "user.", userName: <#T##String#>, gender: <#T##Bool#>, height: <#T##Double#>, weight: <#T##Double#>, birthDate: <#T##Date#>, phoneNumber: <#T##String#>)
            }
        })
        
        self.signUpUserProfileSubscriber = self.userService.signUpUserProfileSubject.sink(receiveValue: {
            
            response in
            
            if let error = response.error {
                
                print(error.rawValue)
            }
            
            if let user = response.user {
                
                print(user)
                testExpectation2.fulfill()
            }
        })
        
        self.userService.loadCoreDataUsers()
        self.userService.verifyEmailAlredySignedUp("test@test.com")
        self.userService.signUpEmailAndPassword(email: "test@test.com", password: "123456")
        
        waitForExpectations(timeout: 10)
    }
    
}
