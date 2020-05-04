//
//  SessionStore.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/1/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: User? { didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?

    func listen(){
        handle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(
                    uid : user.uid,
                    displayName: user.displayName,
                    email: user.email
                )
            }else{
                self.session = nil
            }
        }
    }
    func signUp(email: String,
                password: String,
                handler: @escaping AuthDataResultCallback)
    {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        if(self.session != nil){
            print(email)
        }
        if(self.session == nil){
                   print("Not")
               }
    }
    
    func signOut () -> Bool {
 
            do{
                try Auth.auth().signOut()
                self.session = nil
                return true
            }catch{
            return false
            }
        
    }
    
    func unbind(){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}

