//
//  SearchView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 23/07/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @Binding var guessedSong: SongModel?
    @Environment(GameViewModel.self) var gameViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
                TextField("give", text: $searchText)
                    .font(.title2)
                    .frame(maxWidth: 400,minHeight: 35)
                    .background(.white,in: RoundedRectangle(cornerRadius: 5))
                    .padding(.leading,30)
                    .padding(.top,30)
                
            
            let remainingSongs = songList.filter { song in
                !gameViewModel.guessesList.contains { guessedSong in
                    guessedSong.songTitle == song.songTitle
                }
            }
            
            let filteredList = remainingSongs.filter { searchText.isEmpty ? true : $0.songTitle.lowercased().hasPrefix(searchText.lowercased())}
            VStack {
                
                
                Divider()
                ScrollView{
                    ForEach(filteredList) { item in
                        
                        VStack{
                            Text(item.songTitle)
                                .font(.subheadline)
                            
                            
                            Divider()
                        }
                        .onTapGesture {
                            searchText = item.songTitle
                            guessedSong = item
                           // gameViewModel.addGuess(item)
                        }
                    }
                }
                
            }
            .frame(maxWidth: 400)
            .background(.white,in: RoundedRectangle(cornerRadius: 5))
            .padding(.leading,30)
            .frame( height: 45)
            .opacity(filteredList.isEmpty ? 0 : 1)
            .opacity(searchText.isEmpty ? 0 : 1)
            
        }
        
    }
}


