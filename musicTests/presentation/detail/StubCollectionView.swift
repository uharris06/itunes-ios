//
//  StubCollectionView.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubCollectionView: StubBaseView, CollectionView {
  
  var playPreviewCalled = false
  var pausePreviewCalled = false
  
  func playPreview() {
    playPreviewCalled = true
  }
  
  func pausePreview() {
    pausePreviewCalled = true
  }
}
