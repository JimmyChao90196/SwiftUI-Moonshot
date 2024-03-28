//
//  ContentView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.ROG)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, axis in
                    width * 0.8
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
