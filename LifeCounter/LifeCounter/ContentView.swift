//
//  ContentView.swift
//  LifeCounter
//
//  Created by Juan Carlos Garcia on 4/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var player1Life = 20
    @State private var player2Life = 20
    
    mutating func decrement(playerLife: Int) {
        
    }
    
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            
            VStack {
                
                // Player 1 section
                VStack{
                    Label("Player 1", systemImage: "person")
                        .font(.title2)
                    
                    Label("Total Life: \(player1Life)", systemImage: "heart")
                    
                    HStack {
                        
                        Button(action: {
                            self.player1Life -= 1
                            print("buton pressed", player1Life)
                        }) {
                            Text("-")
                        }

                        
                        Button(action: {
                            self.player1Life += 1
                            print("buton pressed", player1Life)
                        }) {
                            Text("+")
                        }
                    }
                    
                    HStack {
                        
                        Button(action: {
                            self.player1Life -= 5
                            print("buton pressed", player1Life)
                        }) {
                            Text("-5")
                        }

                        
                        Button(action: {
                            self.player1Life += 5
                            print("buton pressed", player1Life)
                        }) {
                            Text("+5")
                        }
                    }
                    
                    
                }.padding(.top, 100)
                    .padding(.bottom, 20)
                
                
                
                    Spacer()
                
                // Player 2 section
                VStack {
                    Label("Player 2", systemImage: "person")
                        .font(.title2)
                    
                    Label("Total Life: \(player2Life)", systemImage: "heart")

                    
                    HStack {
                        
                        Button(action: {
                            self.player2Life -= 1
                            print("buton pressed", player2Life)
                        }) {
                            Text("-")
                        }
                        
                        Button(action: {
                            self.player2Life += 1
                            print("buton pressed", player2Life)
                        }) {
                            Text("+")
                        }
                    }
                    
                    HStack {
                        
                        Button(action: {
                            self.player2Life -= 5
                            print("buton pressed", player2Life)
                        }) {
                            Text("-5")
                        }
                        
                        Button(action: {
                            self.player2Life += 5
                            print("buton pressed", player2Life)
                        }) {
                            Text("+5")
                        }
                    }
                    
                    
                }
                    .padding(.bottom, 100)
                    .padding(.top, 20)
                
                if player2Life <= 0 {
                    Label("Player 2 LOSES!", systemImage: "person")
                }
                
                if player1Life <= 0 {
                    Label("Player 1 LOSES!", systemImage: "person")
                }
            }
        }
    }
}

#Preview (){
    ContentView()
}
