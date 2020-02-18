//
//  ResultsExt.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {

    func toArray<T>(ofType: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
