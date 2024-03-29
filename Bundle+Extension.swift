//
//  Bundle+Extension.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(filename: String) -> T {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't locate the file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load the file")
        }
        
        guard let responce = try? JSONDecoder().decode(T.self, from: data) else{
            fatalError("Couldn't decode the file")
        }
        
        return responce
    }
    
}
