//
//  FirebaseCode.swift
//  YandMios
//
//  Created by Kamila Ponomarova on 2025-05-20.
//

//
//  

import Foundation
import FirebaseAuth

@Observable class Firebasecode {
    
    var loginerror : String?
    
    func userRegister(email : String, password : String, name: String) {
            Task {
                do {
                    let regResult = try await Auth.auth().createUser(withEmail: email, password: password)
                    
                    
                } catch {
                    print("FEL REG")
                    loginerror = "Error reg"
                }
            }
        }
    
    func userLogin(email : String, password : String) {
            Task {
                do {
                    try await Auth.auth().signIn(withEmail: email, password: password)
                } catch {
                    print("FEL LOGIN")
                    loginerror = "Error login"
                }
            }
        }
    
    func userLogout() {
        do {
            try Auth.auth().signOut()
        } catch {
        
        }
    }
}
