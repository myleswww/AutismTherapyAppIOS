//
//  BreatheView.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 11/10/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import SwiftUI


struct BreatheView: View {
    
    @State private var isAnimating = false
    @State private var breathIn = false
    @State private var breathOut = false
    @State private var hold = true
    @State private var circuLarMotion = false
    @State private var displayHold = false
    @State private var displayBreathOut = false
    @State private var hideBreathOut = false
    @State private var hideBreathIn = false
    @State private var hideHold = false
    @State private var displaySecondHold = false
    @State private var hideSecondHold = false
    @State private var timer: Timer?
    @State private var selectedSecs = 600
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 16).repeatForever(autoreverses: false)
    }
    
    
    let grape = Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
    let aqua = Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
    let iron = Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))
    let snow = Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
    let screenBackground = Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1))
    let fillGradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var repeatingAnimation: Animation {
        Animation
            .linear(duration: 600).repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            ZStack {
                screenBackground
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    
                    fillGradient
                        .clipShape(
                            Circle())
                        .frame(width: 300, height: 300)
                    
                   
                    ZStack {
                        
                        Capsule()  // Rotating capsule
                            .frame(width: 30, height: 30)
                            .foregroundColor(aqua)
                            .offset(y: 177) //187
                            .rotationEffect(.degrees(circuLarMotion ? 360 : 0))
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 16).repeatForever(autoreverses: false)) {
                                self.circuLarMotion = true
                                }
                        }
                    }
                    
                }.frame(width: 320, height: 320)
                    .scaleEffect(breathIn ? 1 : 0.8)
                    .scaleEffect(hold ? 1 : 1)
                    .scaleEffect(breathOut ? 0.8 : 1)
                    .onAppear() {
                
                        withAnimation(Animation.linear(duration: 4)){
                        self.breathIn.toggle()
                        
                        }
                        
                        withAnimation(Animation.linear(duration: 3).delay(4)){
                        self.hold.toggle()
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(8)){
                        self.breathOut.toggle()
                        
                        }
                        
                        withAnimation(Animation.linear(duration: 3).delay(12)){
                        self.hold.toggle()
                       
                        }
                        
                    }
                }
                  
              
                ZStack {
                    Text("Breath Out")
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(displayBreathOut ? 1 : 0)
                        .opacity(hideBreathOut ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                                 self.displayBreathOut.toggle()
                            }
                            
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                                 self.hideBreathOut.toggle()
                            }
                    }
                    
                    Text("Hold") // Second hold
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(displaySecondHold ? 1 : 0)
                        .opacity(hideSecondHold ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                                 self.displaySecondHold.toggle()
                            }
                            
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
                                 self.hideSecondHold.toggle()
                            }
                    }
                    
                    Text("Hold")
                        .foregroundColor(snow)
                        .scaleEffect(1)
                        .opacity(displayHold ? 1 : 0)
                        .opacity(hideHold ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(4)) {
                                 self.displayHold.toggle()
                            }
                            
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                                 self.hideHold.toggle()
                            }
                    }
                    
                    Text("Breath In")
                        .foregroundColor(snow)
                        .opacity(hideBreathIn ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 0.4).delay(4))
                        .onAppear(){
                            self.hideBreathIn.toggle()
                    }
                }
                    
        }
            
            
        }
        
    }

