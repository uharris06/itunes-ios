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
    
    defaultContainer.register(PlayerManager.self) { _ in PlayerManager() }
    .inObjectScope(.container)
    defaultContainer.register(NetworkManager.self){ _ in NetworkManager() }
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
    
    defaultContainer.storyboardInitCompleted(TermsViewController.self) { r, c in
      c.presenter = r.resolve(TermsPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(CollectionViewController.self) { r, c in
      c.presenter = r.resolve(CollectionPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
  }
  
  static func resolvePresenters(_ defaultContainer: Container) {
    defaultContainer.register(BasePresenter.self) { _ in
      BasePresenter()
    }
    
    defaultContainer.register(SearchPresenter.self) { r in
      SearchPresenter(
        searchRepositoryNetwork: r.resolve(SearchRepositoryNetwork.self)!,
        searchRepositoryDatabase: r.resolve(SearchRepositoryDataBase.self)!,
        networkManager: r.resolve(NetworkManager.self)!
      )
    }
    
    defaultContainer.register(TermsPresenter.self) { r in
      TermsPresenter(searchRepositoryDatabase: r.resolve(SearchRepositoryDataBase.self)!)
    }
    
    defaultContainer.register(CollectionPresenter.self) { r in
      CollectionPresenter(playerManager: r.resolve(PlayerManager.self)!)
    }
  }
}
