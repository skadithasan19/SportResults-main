//
//  Dictionary+Utilities.swift
//  SportResults
//
//  Created by Adit Hasan on 10/25/21.
//

import Foundation

class Box<A> {
  var value: A
  init(_ val: A) {
    self.value = val
  }
}

public extension Sequence {
  func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
    var categories: [U: Box<[Iterator.Element]>] = [:]
    for element in self {
      let key = key(element)
      if case nil = categories[key]?.value.append(element) {
        categories[key] = Box([element])
      }
    }
    var result: [U: [Iterator.Element]] = Dictionary(minimumCapacity: categories.count)
    for (key, val) in categories {
      result[key] = val.value
    }
    return result
  }
}
