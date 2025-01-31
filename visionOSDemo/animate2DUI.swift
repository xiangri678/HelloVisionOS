//
//  animate2DUI.swift
//  visionOSDemo
//
//  Created by Chloe Lauren on 11/19/24.
//

import SwiftUI

struct DemoView: View {
    @State private var rotation: Double = 0
    @State private var hoverEnabled: Bool = false

    var body: some View {
        ZStack {
            // 背景
            Color.gray.opacity(0.2)
                .ignoresSafeArea()

            HStack(spacing: 40) {
                // 1. 阴影和视觉效果
                Text("Shadow & Visual Effect")
                    .font(.title)
                    .padding()
                    .background(.thinMaterial) // 使用视觉效果
                    .cornerRadius(10)
                    .shadow(color: .blue, radius: 10, x: 5, y: 5)

                // 2. Hover效果
                Text("Hover Effect")
                    .font(.title2)
                    .padding()
                    .background(.yellow)
                    .cornerRadius(10)
                    .hoverEffect(.highlight, isEnabled: hoverEnabled)
                    .onTapGesture {
                        hoverEnabled.toggle()
                    }

                // 3. ZStack和动画
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 150, height: 150)
                        .shadow(color: .black.opacity(0.5), radius: 10)

                    Text("3D Transform")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .animation(.easeInOut(duration: 0.5), value: hoverEnabled)

                // 4. 3D旋转效果
                Text("Rotate Me!")
                    .font(.headline)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
                    .perspectiveRotationEffect(.degrees(rotation), axis: (x: CGFloat(1), y: CGFloat(1), z: CGFloat(0)), anchor: .center, anchorZ: 0)
                    .onTapGesture {
                        withAnimation {
                            rotation += 45
                        }
                    }
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
