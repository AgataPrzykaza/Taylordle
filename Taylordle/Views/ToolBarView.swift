//
//  ToolbarContent.swift
//  Taylordle
//
//  Created by Agata Przykaza on 25/07/2024.
//

import SwiftUI

struct ToolBarView: ToolbarContent {
    
    @Binding var ruleSheetPresent: Bool
    @Binding var showPopUpStrike: Bool

    var body: some ToolbarContent {
        
        ToolbarItem(placement: .topBarLeading) {
            
            NavigationLink {
                MenuView()
            } label: {
                Image(systemName: "line.3.horizontal")
            }

        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                
                showPopUpStrike.toggle()
                
            } label: {
                Image(systemName: "flame.fill")
                    .tint(Color.accentColor)
            }
            
            
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                ruleSheetPresent.toggle()
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .tint(Color.accentColor)
            }
        }
    }
}


