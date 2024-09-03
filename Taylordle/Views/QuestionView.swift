//
//  QuestionView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 24/07/2024.
//

import SwiftUI

struct QuestionView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ScrollView{
           
            VStack(alignment: .leading){
                
                HStack{
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    
                }
                
                Section {
                    Text("• The game randomly selects a song. ")
                        .padding(.top,7)
                    
                    
                    Text("• Enter your guess by typing the song title and clicking Submit button.")
                        .padding(.top,4)
                    
                    Text("Feedback")
                        .padding(.top,4)
                        .bold()
                    Text("  - After each guess, you'll get feedback on each category:")
                        .padding(.top,4)
                    
                    Text("  - Use the arrows for guidence")
                        .padding(.top,4)
                    
                    HStack{
                        Color.green
                            .frame(width: 70,height: 30)
                            .overlay{
                                
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                            }
                        Text("    - **Green**: Correct with checkmark")
                    } .padding(.top,4)
                    
                    
                    HStack{
                        Color("purple")
                            .frame(width: 70,height: 30)
                            .overlay{
                                
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.white)
                            }
                        Text("    - **Purple**: Incorrect")
                    } .padding(.top,4)
                    
                    Text("End of Game:")
                        .padding(.top,4)
                        .bold()
                    Text("  You win if you guess the song title correctly.")
                    
                    
                } header: {
                    Text("Rules")
                        .bold()
                        .font(.title2)
                }
                
                
            }
            .padding(10)
        }
       
        .frame(maxWidth: .infinity)
        .background(Color(.purple).opacity(0.8))
      
        
    }
}

#Preview {
   
        QuestionView()
    
}
