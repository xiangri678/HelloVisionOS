//
//  Volumetric.swift
//  visionOSDemo
//
//  Created by Chloe Lauren on 11/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VolumetricWindow: View {
    static let defaultSize: CGFloat = 0.55
    private let modelDepth: Double = 200
    let modelName: String = "grainrain"

    var body: some View {
        // 使用 GeometryReader 获取视图的高度、宽度和深度信息
        GeometryReader3D { geometry in
            RealityView { content in
                guard let model = try? await ModelEntity(named: modelName) else {
                    print("无法找到 \(modelName)，加载失败")
                    return
                }
                content.add(model)
            }
            update: { content in
                // 获取加载的实体以调整大小
                guard let model = content.entities.first(where: {
                    return  $0.name == modelName
                }) else {
                    print("更新时获取对象 \(modelName) 失败")
                    return
                }

                // 在本地坐标中定义的视图边界尺寸
                let viewBounds = content.convert(
                    geometry.frame(in: .local),
                    from: .local,
                    to: .scene
                )

                // 设置模型的位置，使其位于视觉边界框的底部
                model.position.y -= model.visualBounds(relativeTo: nil).min.y

                // 调整模型在 Y 轴上的位置以与视图边界对齐
                model.position.y += viewBounds.min.y

                // 当缩放比例为 1 时模型的基础尺寸
                let baseExtents = model.visualBounds(relativeTo: nil).extents / model.scale

                // 模型适应体积窗口边界所需的缩放比例
                let scale = Float(viewBounds.extents.x) / baseExtents.x

                // 应用缩放比例以填充窗口的完整大小
                model.scale = SIMD3<Float>(repeating: scale)
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    VolumetricWindow()
}
