//
//  StrikeView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 25/07/2024.
//

import SwiftUI

struct StrikeView: View {
    
   
   
    @Binding  var gamesWon: Int 
    @Binding var strike: Int
    
    @Binding var showPopUpStrike: Bool
    
    var body: some View {
        
        VStack{
        
            HStack{
                Spacer()
                Button(action: {
                    showPopUpStrike.toggle()
                }, label: {
                    Image(systemName: "xmark")
                })
               
            }
            .padding(.bottom,20)
            
            HStack{
                
                VStack{
                    Text("Strike")
                    Text("\(strike)")
                }   .padding()
                    .background(.white,in: RoundedRectangle(cornerRadius: 10))
                    .bold()
                    
                    VStack{
                        Text("Games Won")
                        Text("\(gamesWon)")
                    }   .padding()
                        .background(.white,in: RoundedRectangle(cornerRadius: 10))
                        .bold()
                
            }
        }
       
        .frame(maxWidth: 300)
        .padding()
        .background(Color(.red), in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: .purple,radius: 50)
    }
}


