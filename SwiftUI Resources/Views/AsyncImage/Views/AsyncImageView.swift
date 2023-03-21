//
//  AsyncImageView.swift
//  SwiftUI Resources
//
//  Created by Md Abir Hossain on 21/3/23.
//

import SwiftUI

struct AsyncImageView: View {
    
    private let imageURL: String = "https://w0.peakpx.com/wallpaper/713/259/HD-wallpaper-joker-art-joker-face.jpg"
    
    var body: some View {
        
//            // MARK: - Simple AsyncImage
//        AsyncImage(url: URL(string: imageURL))
//
//            // MARK: - Scale AsyncImage
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
//
//            // MARK: - PlaceHolder AsyncImage
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
//
//
//        // MARK: - Phase Async Image
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            // If SUCCESS image will load
//            // If FAILED load will fail and show error icon
//            // if EMPTY empty image will show
//
//            if let image = phase.image {
//                image
//                    .imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill")
//                    .iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill")
//                    .iconModifier()
//            }
//        }
//        .padding(40)
        
        
            // MARK: - Animation AsyncImage
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case.success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case.failure(_):
                Image(systemName: "ant.circle.fill")
                    .iconModifier()
            case.empty:
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}


struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
