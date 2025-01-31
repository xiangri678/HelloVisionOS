//
//  Window.swift
//  visionOSDemo
//
//  Created by Chloe Lauren on 11/21/24.
//

import SwiftUI

struct GrainRainView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // 背景图像
                Image("Background_GrainRain")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                    .opacity(0.8)

                // 内容布局
                HStack(spacing: 40) {
                    // 文本卡片区域
                    TextCardView()

                    // 图片展示区域
                    Image("Hero_GrainRain")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, alignment: .center)
                        .ignoresSafeArea()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding([.leading, .trailing], 20)
        .padding(.bottom, 4)
    }
}

struct TextCardView: View {
    var body: some View {
        ZStack {
            // 灰色半透明背景
            Color.gray.opacity(0.6)
                .cornerRadius(30)

            // 文本内容
            VStack(alignment: .leading, spacing: 0) {
                // 标题
                Text("春的甘露")
                    .font(.system(size: 55, weight: .bold))
                    .padding(.bottom, 65)
                // 正文
                Text(
                    """
                    谷雨，春天的尾音，带着细雨润泽大地。它是万物苏醒的告别，是田野间的希望种子在细雨中轻轻发芽。每一滴春雨，似乎都在诉说着大地的温柔与生机，轻轻吻过沉睡的土地，带来生长的力量。
                    """
                )
                .font(.system(size: 36))
                .padding(.bottom, 24)
            }
            .padding(40)
        }
        .padding(40)
        .frame(width: 600, alignment: .leading)
    }
}

#Preview(windowStyle: .plain) {
    GrainRainView()
}
