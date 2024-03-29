//
//  Astronaut.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
}

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var id: Int
    var launchDate: String?
    var crew: [CrewRole]
    var description: String
}
