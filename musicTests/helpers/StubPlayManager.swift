//
//  StubPlayManager.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubPlayManager: PlayerManager {
  var playCalled = false
  var pauseCalled = false
  var setUrlCalled = false
  
  override func setUrl(previewUrl: String) {
    setUrlCalled = true
  }
  
  override func pause() {
    pauseCalled = true
  }
  
  override func play() {
    playCalled = true
  }
}
