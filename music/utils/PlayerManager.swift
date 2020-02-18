//
//  PlayerManager.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerManager {
  
  var player: AVPlayer?
  
  deinit {
    player = nil
  }
  
  func setUrl(previewUrl: String) {
    let url = URL(string: previewUrl)
    player = AVPlayer(url: url!)
  }
  
  func play() {
    player?.play()
  }
  
  func pause() {
    player?.pause()
  }
}
