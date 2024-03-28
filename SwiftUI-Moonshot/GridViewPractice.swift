//
//  GridViewPractice.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct GridViewPractice: View {
    
    let layout = [
        //GridItem(.adaptive(minimum: 80, maximum: 80))
        GridItem(.adaptive(minimum: 80, maximum: 80), alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<999) {
                    Text("item \($0)")
                        .padding()
                        .frame(width: 80, height: 80)
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    GridViewPractice()
}