//
//  SessionStore.swift
//  Authentication
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject{


    @Published var email1: String = ""
    @Published var useremail23: String = ""
    @Published var firstname23: String = ""
@Published var lastname23: String = ""
    @Published var ip: Bool = false

    @ObservedObject public var passes = FirebaseCollection<Pass>(collectionRef: passCollectionReference)

    
   
       

    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen(){
        
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email)
                
            }else{
                self.session = nil
            }
        })
    }
    func signUp(email: String, password:String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        email1 = email
    }
    
    public func addNewUser(firstname: String, lastname: String, useremail: String){
        let db = Firestore.firestore()

    let pizzeriasRef = db.collection("Users")

    pizzeriasRef.document().setData([
        "Email":useremail,
        "FirstName":firstname,
        "LastName":lastname
    ])

    }
    

    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        email1 = email

    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.session = nil
        }catch{
            print("Error signing out")
        }
    }
    
    func unbind(){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
}



struct User{
    var uid: String
    var email: String?
    
    
    init (uid: String, email:String?){
        self.uid = uid
        self.email = email
    }
}
