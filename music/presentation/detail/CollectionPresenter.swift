//
//  CollectionPresenter.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class CollectionPresenter: BasePresenter, CollectionActionListener {
  
  private var view: CollectionView? {
    return baseView as? CollectionView
  }
  
  private var playerManager: PlayerManager!
  
  init(playerManager: PlayerManager) {
    self.playerManager = playerManager
  }
  
  func onPlay(url: String) {
    playerManager.setUrl(previewUrl: url)
    playerManager.play()
    view?.playPreview()
  }
  
  func onPause() {
    playerManager.pause()
    view?.pausePreview()
  }
}
