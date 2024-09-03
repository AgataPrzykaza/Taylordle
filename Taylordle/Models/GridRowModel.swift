//
//  GridRowModel.swift
//  Taylordle
//
//  Created by Agata Przykaza on 24/07/2024.
//

import Foundation

class GridRowModel {
    
    let songRandom : SongModel
    init(songRandom: SongModel) {
        self.songRandom = songRandom
       
    }
    
    let width: CGFloat = 65
    let height: CGFloat = 75
    
    var boxCheck: [Bool] = [false,false,false,false,false]
    
    
    func checkCorrectSong() -> Bool {
        return boxCheck.contains(false) ? false : true
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
    
    func sfSymbol(forComparison comparison: ComparisonResult) -> String {
        switch comparison {
        case .orderedAscending:
            return "chevron.down"
        case .orderedDescending:
            return "chevron.up"
        case .orderedSame:
            return "checkmark"
     
        }
    }

    func compareNumbers(_ a: Int, _ b: Int) -> String {
        let comparisonResult: ComparisonResult
        if a < b {
            comparisonResult = .orderedAscending
        } else if a > b {
            comparisonResult = .orderedDescending
        } else {
            comparisonResult = .orderedSame
        }
        return sfSymbol(forComparison: comparisonResult)
    }
    
}
