//
//  SKTAudio.swift
//  run
//
//  Created by Олеся Скидан on 07.05.2024.
//

import AVFoundation

class SKTAudio {
    
    var bgMusic: AVAudioPlayer?
    var soundEffect: AVAudioPlayer?
    
    static func sharedInstance() -> SKTAudio {
        return SKTAudioInstance
    }
    
    func playBGMusic(_ fileNamed: String) {
        if !SKTAudio.musicEnable { return }
        guard let url = Bundle.main.url(forResource: fileNamed, withExtension: nil) else { return }
        
        do {
            bgMusic = try AVAudioPlayer(contentsOf: url)
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            bgMusic = nil
        }
        
        if let bgMusic = bgMusic {
            bgMusic.numberOfLoops = -1
            bgMusic.prepareToPlay()
            bgMusic.play()
        }
    }
    
    func stopBGMusic() {
        if let bgMusic = bgMusic {
            if bgMusic.isPlaying {
                bgMusic.stop()
            }
        }
    }
    
    func pauseBGMusic() {
        if let bgMusic = bgMusic {
            if bgMusic.isPlaying {
                bgMusic.pause()
            }
        }
    }
    
    func resumeBGMusic() {
        if let bgMusic = bgMusic {
            if bgMusic.isPlaying {
                bgMusic.play()
            }
        }
    }
    
    func playSoundEffect(_ fileNamed: String) {
        guard let url = Bundle.main.url(forResource: fileNamed, withExtension: nil) else { return }
        
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            soundEffect = nil
        }
        
        if let soundEffect = soundEffect {
            soundEffect.numberOfLoops = 0
            soundEffect.prepareToPlay()
            soundEffect.play()
        }
    }
    
    static let keyMusic = "keyMusic"
    static var musicEnable: Bool = {
        return !UserDefaults.standard.bool(forKey: keyMusic)
    }() {
        didSet {
            let value = !musicEnable
            UserDefaults.standard.setValue(value, forKey: keyMusic)
            
            if value {
                SKTAudio.sharedInstance().stopBGMusic()
            }
        }
    }
}

private let SKTAudioInstance = SKTAudio()

