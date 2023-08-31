//
//  Loadable.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import SwiftUI

protocol Loadable: ObservableObject {
  associatedtype Output
  var state: LoadingState<Output> { get }
  func load()
}

enum LoadingState<Output> {
  case idle
  case failed(Error)
  case loaded(Output)
  case loading
}
