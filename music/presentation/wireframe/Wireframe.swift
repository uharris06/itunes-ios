//
//  Wireframe.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.

import UIKit
import Swinject

class Wireframe {
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
