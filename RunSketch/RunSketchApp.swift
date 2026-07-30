//
//  RunSketchApp.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 13/7/2026.
//
import SwiftData
import SwiftUI

@main
struct RunSketchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: RunModel.self)
    }
}
