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
    func buttonPressedSound() {
        if let path = Bundle.main.path(forResource: "Popped", ofType: "wav") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "wav")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
    
    func bigWordSound(){
        if let path = Bundle.main.path(forResource: "big word selected 1", ofType: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path), fileTypeHint: "mp3")
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
    }
    
//    func bigWord2Sound(){
//
//        if let path = NSBundle.mainBundle().pathForResource("big word selected", ofType: "mp3") {
//
//            audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
//
//
//            if let sound = audioPlayer {
//
//                sound.prepareToPlay()
//
//                sound.play()
//
//            }
//
//        }
//
//    }
//    func fingerSlideSound(){
//
//        if let path = NSBundle.mainBundle().pathForResource("finger slide", ofType: "mp3") {
//
//            audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
//
//
//            if let sound = audioPlayer {
//
//                sound.prepareToPlay()
//
//                sound.play()
//
//            }
//
//        }
//
//    }
//    func smallWordSound(){
//
//        if let path = NSBundle.mainBundle().pathForResource("small word selected", ofType: "mp3") {
//
//            audioPlayer = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3")
//
//
//            if let sound = audioPlayer {
//
//                sound.prepareToPlay()
//
//                sound.play()
//
//            }
//
//        }
//
//    }
}
