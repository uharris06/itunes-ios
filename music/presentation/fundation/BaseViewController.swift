//
//  BaseViewController.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

class BaseViewController<T: BasePresenter>: UIViewController, BaseView {

  typealias Presenter = T

  var presenter: Presenter!
  var wireframe: Wireframe!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.attachView(view: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.attachView(view: self)
  }

  internal func getScreenNameForGoogleAnalytics() -> String? {
    return nil
  }

  func getViewController() -> UIViewController {
    return self
  }

  // MARK: - BaseView

  func showLoading() {
    HUD.show(.progress)
    HUD.dimsBackground = true
  }

  func hideLoading() {
    HUD.hide()
  }

  func showSimpleAlert(message: String) {
    let alert = UIAlertController(title: "Atención", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}

extension UIViewController {

  func showAlertMessage(_ message: String) {
    let alert = UIAlertController(title: "Atención",
                                  message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    present(alert, animated: true, completion: nil)
  }

  func showAlertMessage(_ message: String, action: UIAlertAction) {
    let alert = UIAlertController(title: "Atención", message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }

  func showAlertMessage(_ message: String, positiveAction: UIAlertAction, negativeAction: UIAlertAction) {
    let alert = UIAlertController(title: "Atención", message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(positiveAction)
    alert.addAction(negativeAction)
    present(alert, animated: true, completion: nil)
  }

  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
