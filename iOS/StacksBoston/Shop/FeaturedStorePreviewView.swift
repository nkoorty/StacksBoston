//
//  FeaturedStorePreviewView.swift
//  StacksBoston
//
//  Created by Artemiy Malyshau on 27/04/2024.
//

import SwiftUI

struct FeaturedStorePreviewView: View {
    
    var image: String
    var name: String
    var isOnOffer: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 2) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.white.opacity(0.6), lineWidth: 1)
                    )
                
                Text(name)
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
}

#Preview {
    FeaturedStorePreviewView(image: "coke", name: "Coke")
        .preferredColorScheme(.dark)
}
