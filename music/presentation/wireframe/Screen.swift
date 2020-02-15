//
//  Screen.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit

class Screen {
  private let viewController: UIViewController
  private let isModal: Bool

  init(viewController: UIViewController, isModal: Bool = true) {
    self.viewController = viewController
    self.isModal = isModal
  }

  func get() -> UIViewController {
    return viewController
  }

  func show() {
    if isModal {
      presentViewController(viewController)
    } else {
      pushViewController(viewController)
    }
  }
}

extension Screen {

  // MARK: - Present Methods
  func presentViewController(_ viewController: UIViewController) {
    UIApplication.topViewController()!.present(viewController, animated: true, completion: nil)
  }

  // MARK: - Push Methods
  func pushViewController(_ viewController: UIViewController) {
    // Push if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController {
      setBackButtton(navigationVC: navigationController)
      if let viewControllerNVC = viewController as? UINavigationController,
        let firstViewController = viewControllerNVC.viewControllers.first {
        navigationController.pushViewController(firstViewController, animated: true)
      } else {
        navigationController.pushViewController(viewController, animated: true)
      }
    } else { // If not, Present
      presentViewController(viewController)
    }
  }

  func setBackButtton(navigationVC: UINavigationController) {
    let backButton = UIBarButtonItem()
    backButton.title = ""
    backButton.tintColor = UIColor.white
    navigationVC.viewControllers.last?.navigationItem.backBarButtonItem = backButton
  }
}
