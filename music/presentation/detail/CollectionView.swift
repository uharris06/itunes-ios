//
//  CollectionView.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

protocol CollectionView: BaseView {
  func playPreview()
  func pausePreview()
}

protocol CollectionActionListener {
  func onPlay(url: String)
  func onPause()
}

