//
// 
// FileName: ParallaxEffectView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 17-09-2024 at 6:36 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

let imageSet = ["person", "person", "person", "person", "person"]

struct ParallaxEffectView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) private var colorScheme
    private let images = imageSet
    
    // MARK: - Body
    var body: some View {
        GeometryReader(content: { geometry in
            let width = geometry.size.width
            let height = 1.25 * width
            let offset = -width / 2
            
            VStack(spacing: 20) {
                Text("\(Text("Parallax Effect").foregroundStyle(.purple))\n\(Text("Carosel").font(.system(size: 23)).foregroundStyle(.pink))")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .shadow(color: colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5) , radius: 0.1, x: 0.0, y: 2)
                
                ScrollView(.vertical, showsIndicators: false) {
                    HStack(spacing: 22) {
                        ForEach(images.indices, id: \.self) { image in
                            Image(systemName: "person")
                            
                        }
                    }
                }
            }
        })
    }
}

// MARK: - Preview
struct ParallaxEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxEffectView()
    }
}
