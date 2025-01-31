//
//  visionOSDemoApp.swift
//  visionOSDemo
//
//  Created by Chloe Lauren on 11/30/24.
//

import SwiftUI

@main
struct visionOSDemoApp: App {

    @State private var appModel = AppModel()

    // volumetric window 的高度倍数
    let heightModifier: CGFloat = 1.5

    var body: some Scene {
        WindowGroup {
            GrainRainView_vol()
            
        }
        
        WindowGroup(id: "volumeGrainRain") {
            VolumetricWindow()
        }
        .windowStyle(.volumetric)
        .defaultSize(
            width: VolumetricWindow.defaultSize,
            height: heightModifier * VolumetricWindow.defaultSize,
            depth: VolumetricWindow.defaultSize, in: .meters)
        
        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
