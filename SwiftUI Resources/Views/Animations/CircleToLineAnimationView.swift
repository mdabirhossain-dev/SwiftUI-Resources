//
// 
// FileName: CircleToLineAnimationView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 08-09-2024 at 12:29 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct CircleToLineAnimationView: View {
    @State private var isShow = true
    @State private var isTop = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                LineView(color: .mint, isShow: $isShow, isTop: $isTop)
                    .scaleEffect(-1)
                
                LineView(color: .purple, isShow: $isShow, isTop: $isTop)
            }
            
            HStack(spacing: 20) {
                LineView(color: .red, isShow: $isShow, isTop: $isTop)
                    .scaleEffect(-1)
                
                LineView(color: .yellow, isShow: $isShow, isTop: $isTop)
            }
            .rotationEffect(.degrees(-90))
            .opacity(0.7)
        }
        .scaleEffect(3)
        .onAppear(perform: {
            startAnimation()
        })
    }
    
    private func startAnimation() {
        withAnimation(.easeInOut(duration: 0.5)) {
            isShow.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation() {
                isTop.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                isShow.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                startAnimation()
            }
        }
    }
}

struct CircleToLineAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleToLineAnimationView()
    }
}



struct LineView: View {
    let color: Color
    @Binding var isShow: Bool
    @Binding var isTop: Bool
    var body: some View {
        ZStack(alignment: .top) {
            Capsule()
                .frame(width: 10, height: isShow ? 50 : 10)
                .frame(maxHeight: .infinity, alignment: isTop ? .top : .bottom)
                .foregroundStyle(color)
        }
        .frame(height: 50)
    }
}
