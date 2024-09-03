//
//  SwiftUIView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 12/07/2024.
//

import SwiftUI

struct GridRowView: View {
    
    var songGuessed: SongModel
    @Environment(GameViewModel.self) var gameViewModel
    
   
    var body: some View {
        
        let gridRowModel = GridRowModel(songRandom: gameViewModel.currentRandomSong!)
        
        Group{
            
            GridRow(alignment: .bottom) {
                
                // SONG TITLE________________________________________
                Rectangle()
                    .frame(width: gridRowModel.width,height: gridRowModel.height)
                    .foregroundStyle(gridRowModel.songRandom.songTitle == songGuessed.songTitle ? .green : Color("purple"))
                    .overlay {
                        Text(songGuessed.songTitle)
                            .foregroundStyle(Color.white)
                            .bold()
                            .font(.footnote)
                    }
                
                
                //ALBUM______________________________________________
                Rectangle()
                    .frame(width: gridRowModel.width + 15,height: gridRowModel.height)
                    .foregroundStyle(gridRowModel.coverForAblum(gridRowModel.songRandom.album).1 == gridRowModel.coverForAblum(songGuessed.album).1 ? .green : Color("purple"))
                    .overlay {
                        VStack(spacing: 5){
                            Image(gridRowModel.coverForAblum(songGuessed.album).0)
                                .resizable()
                                .frame(width: gridRowModel.width - 8,height: gridRowModel.height - 20)
                                .scaledToFit()
                            
                            
                            Image(systemName: gridRowModel.compareNumbers(gridRowModel.coverForAblum(gridRowModel.songRandom.album).1, gridRowModel.coverForAblum(songGuessed.album).1))
                                .foregroundStyle(.white)
                                .font(.caption)
                            
                            
                        }
                        
                    }
                
                
                //TRACK NO._________________________________________________
                Rectangle()
                    .frame(width: gridRowModel.width - 15,height: gridRowModel.height)
                    .foregroundStyle(gridRowModel.songRandom.trackNumber == songGuessed.trackNumber ? .green : Color("purple"))
                    .overlay {
                        VStack(spacing: 10){
                            Text("\(songGuessed.trackNumber)")
                                .foregroundStyle(Color.white)
                                .bold()
                            
                            Image(systemName: gridRowModel.compareNumbers(gridRowModel.songRandom.trackNumber, songGuessed.trackNumber))
                                .foregroundStyle(.white)
                        }
                    }
                
                
                //TRACK LENGTH______________________________________
                Rectangle()
                    .frame(width: gridRowModel.width - 10,height: gridRowModel.height)
                    .foregroundStyle(gridRowModel.songRandom.trackLength == songGuessed.trackLength ? .green : Color("purple"))
                    .overlay {
                        VStack(spacing: 10){
                            Text(convertToTimeString(from: songGuessed.trackLength))
                                .foregroundStyle(Color.white)
                                .bold()
                            
                            Image(systemName: gridRowModel.compareNumbers(gridRowModel.songRandom.trackLength, songGuessed.trackLength))
                                .foregroundStyle(.white)
                            
                            
                        }
                        
                    }
                
                
                
                //FEATURES__________________________________________________
                Rectangle()
                    .frame(width: gridRowModel.width,height: gridRowModel.height)
                    .foregroundStyle(gridRowModel.songRandom.features == songGuessed.features ? .green : Color("purple"))
                    .overlay {
                        Text((songGuessed.features == nil ? "No features": songGuessed.features)! )
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                
            }
            
        }
        .font(.subheadline)
        .multilineTextAlignment(.leading)
        
    }
}

#Preview {
    Grid{
        GridRowView(songGuessed: SongModel(songTitle: "Lover", album: .Lover, trackNumber: 10, trackLength: convertToSeconds(from: "03:41")))
    }
    .environment(GameViewModel())
  
}
