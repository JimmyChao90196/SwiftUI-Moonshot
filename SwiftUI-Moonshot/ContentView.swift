//
//  ContentView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode(filename: "astronauts")
    let missions: [Mission] = Bundle.main.decode(filename: "missions")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var AValue = 0
    @State var BValue = 10
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text("\(mission.displayName)")
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(.lightBG)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBG, lineWidth: 2, antialiased: false)
                            }
                        }
                    }
                }
                .padding([.bottom, .horizontal])
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBG)
            
        }
    }
}


#Preview {
    ContentView()
}
