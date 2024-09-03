//
//  GameViewModel.swift
//  Taylordle
//
//  Created by Agata Przykaza on 12/07/2024.
//

import Foundation
import SwiftUI

@Observable class GameViewModel {
    
  
    var guessesList: [SongModel] = []
    var currentRandomSong: SongModel?
  
   
    
//    init(){
//        self.loadDailySong()
//        
//        
//    }
    
    func checkDate(date: Date){
        
        let storedDate = date
        let today = Date()
        if Calendar.current.isDate(storedDate, inSameDayAs: today) {
            return
        }
        
        loadDailySong()
        
    }
    
   
      
    func loadDailySong() {
        
            
        currentRandomSong = songList.randomElement()!
          guessesList.removeAll()
      }
    
    func coverForAblum(_ album: albumCover) -> (String,Int) {
        switch album {
        case .TTPD:
            return ("ttpd",11)
        case .Midnights:
            return ("midnights",10)
        case .evermore:
            return ("evermore",9)
        case .folklore:
            return ("folklore",8)
        case .Lover:
            return ("lover",7)
        case .reputation:
            return ("reputation",6)
        case.eightyNine:
            return ("eightyNine",5)
        case .Red:
            return ("red",4)
            
        
        }
        
        
    }
    
  
    

    
    func checkSong(song: SongModel) -> Bool{
        
        return song.songTitle == currentRandomSong!.songTitle &&
        song.album == currentRandomSong!.album &&
        song.trackNumber == currentRandomSong!.trackNumber &&
        song.trackLength == currentRandomSong!.trackLength &&
        song.features == currentRandomSong!.features
        
    }
    func addGuess(_ guess: SongModel){
        
        guessesList.append(guess)
        
    }
    
    func generateNewRandomSong(){
        
        var new = songList.randomElement()!
        
        while new.songTitle == currentRandomSong!.songTitle{
            
            new = songList.randomElement()!
            
        }
        return
        
     
    }
    
    
}
