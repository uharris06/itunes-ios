//
//  CollectionViewController.swift
//  music
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewController: UIViewController {

  var search: Search?
  
  @IBOutlet var artImageView: UIImageView!
  @IBOutlet var artistLabel: UILabel!
  @IBOutlet var collectionName: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let data = search {
      artImageView.kf.setImage(with: URL(string: data.imageUrl))
      artistLabel.text = data.artistName
      collectionName.text = data.collectionName
    }
  }
}
