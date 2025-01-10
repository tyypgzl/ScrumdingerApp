//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by Tayyip Güzel on 8.01.2025.
//


import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        print("url: \(url)")
        return AVPlayer(url: url)
    }()
}
