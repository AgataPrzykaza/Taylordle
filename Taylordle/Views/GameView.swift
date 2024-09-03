//
//  GameView.swift
//  Taylordle
//
//  Created by Agata Przykaza on 12/07/2024.
//

import SwiftUI


struct GameView: View {
    
    
    
    @AppStorage("gamesWon")var gamesWon: Int = 0
    @AppStorage("strike") var strike: Int = 0
    @AppStorage("dateo") var dateDouble: Double = Date().addingTimeInterval(-86400).timeIntervalSince1970
    
    @State private var date: Date = Date().addingTimeInterval(-86400)
    
    @State var searchText: String = ""
    @State var guessedSong: SongModel? = nil
    @State var currentSongName: String = ""
    
    @Environment(GameViewModel.self) var gameViewModel
    
    @State var pop: Bool = false
    @State var ruleSheetPresent: Bool = false
    @State var showPopUpStrike: Bool = false
    
    
    func checkDailyStreak() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastPlay = Date(timeIntervalSince1970: dateDouble)
        let daysBetween = Calendar.current.dateComponents([.day], from: lastPlay, to: today).day ?? 0
        
        if daysBetween > 1 {
            strike = 0
        }
    }
    
    
    
    var body: some View {
        
        
        
        ZStack{
            
            if Calendar.current.isDate(Date(timeIntervalSince1970: dateDouble), inSameDayAs: Date()) {
                     CompletedSongView()
             }
            else {
                
                VStack{
                    
                    HStack(alignment: .top){
                        SearchView(searchText: $searchText, guessedSong: $guessedSong)
                        
                        Button {
                            
                            gameViewModel.addGuess(guessedSong!)
                            pop = self.gameViewModel.checkSong(song: guessedSong!)
                            
                            
                            currentSongName = guessedSong?.songTitle ?? ""
                            guessedSong = nil
                            searchText = ""
                            
                            
                            
                        } label: {
                            
                            Text("Submit")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .tint(.white)
                        .padding(.top,30)
                        .disabled(guessedSong == nil ? true : false)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    ScrollView{
                        
                            Grid {
                                if !gameViewModel.guessesList.isEmpty {
                                    ForEach(gameViewModel.guessesList.reversed()) { item in
                                        GridRowView(songGuessed: item)
                                            .padding(.bottom,10)
                                        
                                        
                                    }
                                }
                                
                            
                        }
                        .padding(.top,10)
                       
                        
                        
                        Spacer()
                        
                    }
                    .alert("Congratulations!🎉", isPresented: $pop, actions: {
                        
                        
                        Button("Great") {
                            gamesWon += 1
                            strike += 1
                           
                            
                            date = Date()
                            dateDouble = Date.now.timeIntervalSince1970
                            
                        }
                        
                        
                        
                    }, message: {
                        Text("You have guessed the song correct!\n")
                        + Text(currentSongName)
                    })
                }
                .blur(radius: showPopUpStrike ? 3 : 0)
                
            }
            
            StrikeView(gamesWon: $gamesWon,strike: $strike,showPopUpStrike: $showPopUpStrike)
                .opacity(showPopUpStrike ? 1 : 0)
            
            
            
        }
        .navigationTitle("Taylordle")
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.purple.opacity(0.7))
        .toolbarBackground(Color.purple.opacity(0.9), for: .navigationBar)
        .toolbar{
            
            ToolBarView(ruleSheetPresent: $ruleSheetPresent,showPopUpStrike: $showPopUpStrike)
            
            
        }
        .sheet(isPresented: $ruleSheetPresent) {
            QuestionView()
                .presentationCompactAdaptation(.sheet)
            
            
        }
        .onAppear{
            checkDailyStreak()
        }
        
        
        
        
        
    }
    
    
    
    
}

#Preview {
    
    NavigationStack{
        GameView()
    }
    .environment(GameViewModel())
    
}
