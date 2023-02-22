//
//  Instagram_CloneApp.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 02/01/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct Instagram_CloneApp: App {
    
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainView()
                
            }
        }
    }
}

