//
// 
// FileName: SliderView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 24-08-2024 at 10:27 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct SliderView: View {
    
    @Binding var value: String
    @State private var dragValue: CGFloat = 0.3
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.secondary)
                    .frame(width: geo.size.width, height: 6)
                    .overlay (
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.red)
                            .frame(width: dragValue * geo.size.width, height: 6)
                        , alignment: .leading
                    )
                
                Circle()
                    .fill(.red)
                    .frame(width: 20, height: 20)
                    .offset(x: dragValue * geo.size.width - 20)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ gesture in
                                updateValue(with: gesture, in: geo)
                            })
                    )
            }
        }
        .frame(height: 40)
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        dragValue = min(max(Double(newValue), 0), 1)
        value = String(format: "%.1f", dragValue * 10)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant("3"))
    }
}
