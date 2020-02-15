//
//  PresentationModule.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class PresentationModule {
  
  static func setup(_ defaultContainer: Container) {
    
    defaultContainer.register(Wireframe.self) { _ in Wireframe() }
      .inObjectScope(.container)

    resolvePresenters(defaultContainer)
    resolveViewControllers(defaultContainer)
  }
  
  static func resolveViewControllers(_ defaultContainer: Container) {
    
    defaultContainer.storyboardInitCompleted(UINavigationController.self) { _, _ in }
    
    defaultContainer.storyboardInitCompleted(SearchViewController.self) { r, c in
      c.presenter = r.resolve(SearchPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
  }
  
  static func resolvePresenters(_ defaultContainer: Container) {
    defaultContainer.register(BasePresenter.self) { _ in
      BasePresenter()
    }
    
    defaultContainer.register(SearchPresenter.self) { r in
      SearchPresenter(searchRepositoryNetwork: r.resolve(SearchRepositoryNetwork.self)!)
    }
  }
}
