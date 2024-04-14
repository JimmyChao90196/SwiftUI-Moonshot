//
//  Astronaut.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import Foundation
import SwiftUI

struct CrewMember: Hashable {
    static func == (lhs: CrewMember, rhs: CrewMember) -> Bool {
        lhs.astronaut == rhs.astronaut
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(astronaut)
    }
    
    let role : String
    let astronaut: Astronaut
}

struct Astronaut: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var description: String
}

struct Mission: Codable, Identifiable, Hashable {
    
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
    
    var displayName: String {
        "Apollo \(self.id)"
    }
    
    var image: String {
        "apollo\(self.id)"
    }
    
    var formattedLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLaunchDateB: String {
        dateFormatter.string(from: launchDate ?? Date())
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
