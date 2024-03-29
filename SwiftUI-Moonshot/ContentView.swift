//
//  ContentView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode(filename: "astronauts")
    let missions: [Mission] = Bundle.main.decode(filename: "missions")
    @State var AValue = 0
    @State var BValue = 10
    
    var body: some View {
        VStack {
            Text("\(astronauts.count)")
            Text("\(missions.count)")
            Text("\(AValue)")
        }.onAppear {
            swap(&AValue, &BValue)
        }
    }
    
    //Test function
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

}


#Preview {
    ContentView()
}
