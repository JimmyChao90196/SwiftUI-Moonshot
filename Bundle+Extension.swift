//
//  Bundle+Extension.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import Foundation
import SwiftUI

extension Bundle {
    
    func decode<T: Codable>(filename: String) -> T {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't locate the file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load the file")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let responce = try? decoder.decode(T.self, from: data) else{
            fatalError("Couldn't decode the file")
        }
        
        return responce
    }
}

extension ShapeStyle where Self == Color {
    static var darkBG: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBG: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
