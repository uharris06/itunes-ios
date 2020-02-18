//
//  CollectionViewController.swift
//  music
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewController: BaseViewController<CollectionPresenter>, CollectionView {

  var search: Search?
  
  @IBOutlet var artImageView: UIImageView!
  @IBOutlet var artistLabel: UILabel!
  @IBOutlet var collectionName: UILabel!
  @IBOutlet var playPauseButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let data = search {
      artImageView.kf.setImage(with: URL(string: data.imageUrl))
      artistLabel.text = data.artistName
      collectionName.text = data.collectionName
    }
  }
  
  func playPreview() {
    playPauseButton.setTitle("Pause", for: .normal)
  }
  
  func pausePreview() {
    playPauseButton.setTitle("Play", for: .normal)
  }
  
  @IBAction func onPlayButtonPressed(_ sender: UIButton) {
    if sender.title(for: .normal) == "Play" {
      presenter.onPlay(url: search?.previewUrl ?? "")
    } else {
      presenter.onPause()
    }
  }
}
