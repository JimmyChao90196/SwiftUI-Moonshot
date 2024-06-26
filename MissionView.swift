//
//  MissionView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/30.
//

import SwiftUI

struct MissionView: View {
    
    @Binding var path: NavigationPath
    let mission: Mission
    let crewsMembers: [CrewMember]
    
    init(path: Binding<NavigationPath>, mission: Mission, astronauts: [String: Astronaut]) {
        self._path = path
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
                    
                    Text("Mission Highlight - \(mission.formattedLaunchDateB)")
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
                
                HScrolligView(crewsMembers: crewsMembers, path: $path)
            }
            .padding(.bottom)
        }
        .navigationTitle("\(mission.displayName)")
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBG)
    }
}

//#Preview {
//    let missions: [Mission] = Bundle.main.decode(filename: "missions")
//    let astronauts: [String: Astronaut] = Bundle.main.decode(filename: "astronauts")
//    return MissionView(mission: missions[0], astronauts: astronauts)
//        .preferredColorScheme(.dark)
//}

