//
//  AsyncLoadableView.swift
//  SportResults
//
//  Created by Adit Hasan on 10/22/21.
//

import SwiftUI

struct AsyncLoadableView<Source: Loadable, Content: View>: View {
  @ObservedObject var source: Source
  var content: (Source.Output) -> Content
  
  init(source: Source, @ViewBuilder content: @escaping(Source.Output) -> Content) {
    self.source = source
    self.content = content
  }
    var body: some View {
      switch source.state {
      case .failed(let error):
        Text(error.localizedDescription)
      case .idle:
        EmptyView()
      case .loading:
        ProgressView()
      case .loaded(let output):
        content(output)
      }
    }
}

 
