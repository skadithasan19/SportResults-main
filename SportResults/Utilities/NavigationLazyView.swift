//
//  NavigationLazyView.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
  let build: () -> Content
  init(_ build: @autoclosure @escaping () -> Content) {
    self.build = build
  }
  var body: Content {
    build()
  }
}
