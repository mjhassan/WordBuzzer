//
//  Sounds.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

class Sounds{
    static func button() {
        if let path = Bundle.main.path(forResource: "button", ofType: "wav") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "wav")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
    
    static func correct(){
        if let path = Bundle.main.path(forResource: "correct", ofType: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "mp3")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
    
    static func wrong(){
        if let path = Bundle.main.path(forResource: "wrong", ofType: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "mp3")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
    
    static func gameOver(){
        if let path = Bundle.main.path(forResource: "gameOver", ofType: "wav") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "wav")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
}
