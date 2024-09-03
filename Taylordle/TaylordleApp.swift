//
//  TaylordleApp.swift
//  Taylordle
//
//  Created by Agata Przykaza on 12/07/2024.
//

import SwiftUI
import SwiftData

@main
struct TaylordleApp: App {
    
    @State var gameModelView: GameViewModel = GameViewModel()
   
    @AppStorage("dateo") var dateDouble: Double = Date().addingTimeInterval(-86400).timeIntervalSince1970
    
    init() {
        gameModelView.checkDate(date: Date(timeIntervalSince1970: dateDouble))
    }
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack{
                
               
                GameView()
                   
                   
            }
            .environment(gameModelView)
            
        }
        
      
      
       
       
        
       
       
    }
    
    
    
}
