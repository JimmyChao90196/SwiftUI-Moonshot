//
//  ScrollViewPractice.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct ScrollViewPractice: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollViewPractice()
}
