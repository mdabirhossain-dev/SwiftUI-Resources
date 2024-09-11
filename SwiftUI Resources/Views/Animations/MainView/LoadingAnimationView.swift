//
// 
// FileName: LoadingAnimationView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 11-09-2024 at 7:45 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct LoadingAnimationView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                CircleToLineAnimationView()
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 60)
        }
    }
}


struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
