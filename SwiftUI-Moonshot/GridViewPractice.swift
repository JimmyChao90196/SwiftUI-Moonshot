//
//  GridViewPractice.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct GridViewPractice: View {
    
    let layout = [
        
        GridItem(.adaptive(minimum: 70, maximum: 80), alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<999) {
                    Text("item \($0)")
                        .padding()
                        .containerRelativeFrame(.horizontal) { size, _ in
                            size * 0.2
                        }
                    
                        .containerRelativeFrame(.vertical) { size, _ in
                            size * 0.1
                        }
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    GridViewPractice()
}
