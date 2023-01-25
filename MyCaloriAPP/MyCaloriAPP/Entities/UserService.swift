//
//  UserService.swift
//  MyCaloriAPP
//
//  Created by User on 23/01/23.
//

import Foundation
import Combine
import FirebaseAuth
import CoreData

class UserService {
    
    // Enums del UserService
    
    
    // Propiedades del UserService
    var activeUser: UserEntity?
    
    // Publicadores del UserService
    var verifyEmailAlredySignedUpSubject = PassthroughSubject<Bool, Error>()
    
    // Funcionalidades del UserService
    
    // Verifica si el correo ya se encuentra registrado en Firebase
    func verifyEmailAlredySignedUp(_ email: String) {
        
        Auth.auth().fetchSignInMethods(forEmail: email) {
            
            [weak self] signInMethods, error in
            
            if let error = error {
                
                print("Error al tratar de verificar si el correo electrónico ya se encuentra registrado en FireBase \(error.localizedDescription)")
                self?.verifyEmailAlredySignedUpSubject.send(completion: .failure(error))
            } else {
                
                if let _ = signInMethods {
                    
                    print("El correo ya se encuentra registrado en FireBase")
                    self?.verifyEmailAlredySignedUpSubject.send(true)
                } else {
                    
                    print("El correo no se encuentra registrado en FireBase")
                    self?.verifyEmailAlredySignedUpSubject.send(false)
                }
            }
        }
    }
    
    func signUpEmailAndPassword {
        
        
    }
    
    func signUpUserProfile {
        
        
    }
    
}
