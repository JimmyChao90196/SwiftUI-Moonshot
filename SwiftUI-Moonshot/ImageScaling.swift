//
//  ImageScaling.swift
//  SwiftUI-Moonshot
//
//  Created by JimmyChao on 2024/3/29.
//

import SwiftUI

struct ImageScaling: View {
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
    ImageScaling()
}
