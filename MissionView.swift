//
//  MissionView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/30.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    let crewsMembers: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crewsMembers = mission.crew.map { member in
            guard let astronaut = astronauts[member.name] else { fatalError("Missing Member")}
            return CrewMember(role: member.role, astronaut: astronaut)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.6
                    }
                    .padding()
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBG)
                        .padding(.vertical)
                    
                    Text("Mission Highlight")
                        .font(.headline.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBG)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crewsMembers, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 110, height: 72)
                                        .clipShape(.capsule)
                                        .overlay {
                                            Capsule().strokeBorder(.black, lineWidth: 2.5)
                                        }
                                    
                                    VStack {
                                        Text("\(crewMember.astronaut.name)")
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text("\(crewMember.role)")
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }.padding(.horizontal)
                            }
                        }
                    }
                }.padding(.vertical)
                
            }
            .padding(.bottom)
        }
        .navigationTitle("\(mission.displayName)")
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBG)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode(filename: "missions")
    let astronauts: [String: Astronaut] = Bundle.main.decode(filename: "astronauts")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

