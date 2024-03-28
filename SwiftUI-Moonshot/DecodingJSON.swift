//
//  DecodingJSON.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct DecodingJSON: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            if let response = try? JSONDecoder().decode(
                User.self,
                from: data) {
                print(response)
            }
        }
    }
}

#Preview {
    DecodingJSON()
}
