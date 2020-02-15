//
//  SearchTableViewCell.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {

  @IBOutlet var artImageView: UIImageView!
  @IBOutlet var artistLabe: UILabel!
  @IBOutlet var collectionLabel: UILabel!
  @IBOutlet var trackLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func bind(search: Search) {
    artImageView.kf.setImage(with: URL(string: search.imageUrl))
    artistLabe.text = search.artistName
    collectionLabel.text = search.collectionName
    trackLabel.text = search.trackName
  }
}
