//
//  ContentView.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = SportsViewModel()
  var body: some View {
    AsyncLoadableView(source: viewModel) { comments in
      List(comments, id: \.id) { comment in
          NavigationLink(destination: DetailView(comment: comment)) {
              VStack(alignment: .leading, spacing: 5) {
                  Text(comment.name).font(.title)
                  Text(comment.email)
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(.blue)
              }
          }
      }
    }
    .navigationBarTitle(Text("Results"), displayMode: .automatic)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
