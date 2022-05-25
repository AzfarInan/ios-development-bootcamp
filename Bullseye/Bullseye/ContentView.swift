//
//  ContentView.swift
//  Bullseye
//
//  Created by BS851 on 19/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯")
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding()
            Text("89").padding()
            
            HStack {
                Text("1").padding()
                Slider(value: .constant(10), in: 1.0...100.0)
                Text("100").padding()
            }
            Button("Hit Me") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
