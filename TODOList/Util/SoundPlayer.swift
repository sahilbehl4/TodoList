//
//  SoundPlayer.swift
//  TODOList
//
//  Created by Sahil Behl on 3/31/23.
//

import Foundation
import AVFoundation
import UIKit

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play")
        }
    }
}

let feedback = UINotificationFeedbackGenerator()