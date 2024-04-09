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
    
    @State var isGrid = true
    @State var AValue = 0
    @State var BValue = 10
    
    @ViewBuilder var missionGridView: some View {
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
    
    @ViewBuilder var missionListView: some View {
        ForEach(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
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
    
    var body: some View {
        NavigationStack {
            
            VStack {
                if isGrid {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            missionGridView
                        }
                        .padding([.bottom, .horizontal])
                    }.transition(.slide)

                } else {
                    
                    List {
                        missionListView
                        .listRowBackground(Color.clear)
                        .listRowInsets(.init(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0))
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    .transition(.slide)
                    
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBG)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("\(isGrid ? "Grid": "List")") {
                        isGrid.toggle()
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.trailing, 20)
                }
            }
            .animation(.easeInOut, value: isGrid)
            
        }
    }
}


#Preview {
    ContentView()
}
