//
//  SongMode.swift
//  Taylordle
//
//  Created by Agata Przykaza on 22/07/2024.
//

import Foundation
import SwiftData


class SongModel: Identifiable{
    
    let uid: UUID
    var songTitle: String
    var album: albumCover
    var trackNumber: Int
    var trackLength: Int
    var features: String?
    
    init(songTitle: String, album: albumCover, trackNumber: Int, trackLength: Int, features: String? = nil) {
        self.uid = UUID()
        self.songTitle = songTitle
        self.album = album
        self.trackNumber = trackNumber
        self.trackLength = trackLength
        self.features = features
    }
    
}

enum albumCover {
    case TTPD
    case Midnights
    case evermore
    case folklore
    case Lover
    case reputation
    case eightyNine
    case Red
}



func convertToSeconds(from duration: String) -> Int {
    let components = duration.split(separator: ":")
    guard components.count == 2,
          let minutes = Int(components[0]),
          let seconds = Int(components[1]) else {
        return 0
    }
    return minutes * 60 + seconds
}

func convertToTimeString(from seconds: Int) -> String {
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    return String(format: "%02d:%02d", minutes, remainingSeconds)
}
