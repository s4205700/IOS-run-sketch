//
//  Formatters.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 3/8/2026.
//
import Foundation

struct Formatters {

    static func formatElapsedTime(_ seconds: TimeInterval) -> String {

        let totalSeconds = Int(seconds)

        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60

        if hours > 0 {
            return "\(hours)h \(minutes)m \(secs)s"
        }

        if minutes > 0 {
            return "\(minutes)m \(secs)s"
        }

        return "\(secs)s"
    }
}
