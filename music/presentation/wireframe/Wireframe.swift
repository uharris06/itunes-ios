//
//  Wireframe.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.

import UIKit
import Swinject

class Wireframe {
  
  func collection(search: Search) -> Screen {
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let collectionVC = storyboard.instantiateViewController(withIdentifier: String(describing: CollectionViewController.self)) as! CollectionViewController
    collectionVC.search = search
    return Screen(viewController: collectionVC, isModal: false)
  }
  
  func popCurrentScreen(_ completion: @escaping (() -> Void) = { }) {
    // Pop if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
      navigationController.popViewController(animated: true)
    } else { // If not, dismiss
      UIApplication.topViewController()?.dismiss(animated: true, completion: completion)
    }
  }
  
  func dismissController(animated: Bool = true, completion: (() -> Void)?) {
    UIApplication.topViewController()?.dismiss(animated: animated, completion: {
      completion?()
    })
  }
}
