//
//  NavigationPracticeView.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/28.
//

import SwiftUI

struct NavigationPracticeView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.blue.ignoresSafeArea()
                
                VStack {
                    NavigationLink {
                        Text("Detail view")
                            .navigationTitle("SwiftUI")
                    } label: {
                        VStack {
                            Image(systemName: "face.smiling")
                            Text("Wow")
                            Text("Awesome")
                        }
                    }
                    
                    List {
                        ForEach(0..<100) { num in
                            NavigationLink("Row - \(num)") {
                                Text("Detail").navigationTitle("SwiftUI")
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .padding()
                .background(.ultraThickMaterial)
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
                .clipShape(.rect(cornerRadius: 20))
                .navigationTitle("SwiftUI")
            }
        }
    }
}

#Preview {
    NavigationPracticeView()
}
