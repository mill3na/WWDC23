//
//  Sound.swift
//  WWDC23
//
//  Created by Milena Maia Araújo on 19/04/23.
//

import Foundation
import AVKit

class SoundManager {

    static let instance = SoundManager()

    var player: AVAudioPlayer?

    func playSound(with name: String) {

        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }

    }
    
    func stopSound() {
        player?.pause()
    }
    
    private init(player: AVAudioPlayer? = nil) {
        self.player = player
    }
}

