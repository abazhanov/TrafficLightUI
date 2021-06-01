//
//  ContentView.swift
//  TrafficLightUI
//
//  Created by Artem Bazhanov on 01.06.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var redColor: Color = .red.opacity(0.3)
    @State private var greenColor: Color = .green.opacity(0.3)
    @State private var yellowColor: Color = .yellow.opacity(0.3)
    
    @State private var currentLight = CurrentLight.red
    
    @State private var nameButton = "START"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                ColorCircle(color: redColor)
                    .padding(.bottom, 10)
                ColorCircle(color: yellowColor)
                    .padding(.bottom, 10)
                ColorCircle(color: greenColor)
                Spacer()
                Button(action: {
                    if nameButton == "START" {
                        nameButton = "NEXT"
                    }
                    switch currentLight {
                    case .red:
                        greenColor = .green.opacity(0.3)
                        redColor = .red.opacity(1)
                        currentLight = .yellow
                    case .yellow:
                        redColor = .red.opacity(0.3)
                        yellowColor = .yellow.opacity(1)
                        currentLight = .green
                    case .green:
                        yellowColor = .yellow.opacity(0.3)
                        greenColor = .green.opacity(1)
                        currentLight = .red
                    }
                }) {
                    Text(nameButton)
                        .font(.title)
                        .frame(width: 180, height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 4))
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
