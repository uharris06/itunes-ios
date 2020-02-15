//
//  ApplicationModule.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
  
  class func setup() {
    DataModule.setup(defaultContainer)
    PresentationModule.setup(defaultContainer)
  }
}
