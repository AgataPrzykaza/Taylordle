//
//  CompletedSongView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 26/07/2024.
//

import SwiftUI

struct CompletedSongView: View {
    var body: some View {
        VStack(alignment: .center){
            Group{
                Text("You already guessed todays song !!!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Come back tomorrow for a new one 😉")
                    .font(.headline)
            }
            .bold()
           
            Image("taylorBear")
                .resizable()
                .frame(width: 150,height: 200)
                .scaledToFit()
          
            Spacer()
        }
    }
}

#Preview {
    CompletedSongView()
}
