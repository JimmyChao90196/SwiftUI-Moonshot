//
//  HScrolligView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/4/9.
//

import SwiftUI

struct HScrolligView: View {
    
    let crewsMembers: [CrewMember]
    
    var body: some View {
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
}

