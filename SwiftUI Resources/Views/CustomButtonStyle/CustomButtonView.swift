//
// 
// FileName: CustomButtonView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 29-08-2024 at 12:33 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 36) {
                Button("Neumorphic Button Style") {
                    print("NeumorphicButtonStyle")
                }
                .buttonStyle(NeumorphicButtonStyle())
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.grayBackground.ignoresSafeArea(.all))
                
                
                Button("Pressable Button Style") {
                    
                }
                .buttonStyle(PressableButtonStyle())
            }
            .padding(.top)
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
