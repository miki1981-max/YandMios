//
//  ContentView.swift
//  YandMios
//
//  Created by Kamila Ponomarova on 2025-05-18.
//

//
//  
//
import SwiftUI

import Firebase
import FirebaseAuth

struct ContentView:View
{
    
    @State var isLoggedIn : Bool?
    
    var body: some View {
        
        VStack {
            if isLoggedIn == true {
                RecommendationsView1()
            }
            if isLoggedIn == false {
                StartPageView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                print("USER CHANGE")
                
                if Auth.auth().currentUser == nil {
                    isLoggedIn = false
                } else {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


    

