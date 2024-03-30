//
//  Astronaut.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import Foundation

struct CrewMember {
    let role : String
    let astronaut: Astronaut
}

struct Astronaut: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
}

struct Mission: Codable, Identifiable {
    
    var displayName: String {
        "Apollo \(self.id)"
    }
    
    var image: String {
        "apollo\(self.id)"
    }
    
    var formattedLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var id: Int
    var launchDate: Date?
    var crew: [CrewRole]
    var description: String
    
}
