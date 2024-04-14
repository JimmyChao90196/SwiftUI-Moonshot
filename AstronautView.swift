//
//  AstronautView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/30.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBG)
                    .padding(.vertical)
                
                Text(astronaut.description)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBG)
    }
}

#Preview {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode(filename: "astronauts")
    return AstronautView(astronaut: astronauts["aldrin"]!).preferredColorScheme(.dark)
}
