//
//  LandingPage.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import SwiftUI

struct LandingPage: View {
  var body: some View {
    NavigationView {
      NavigationLink(destination: NavigationLazyView(ContentView())) {
        Text("Get Results")
          .font(.system(size: 14))
          .fontWeight(.medium)
          .padding()
          .background(Color.blue.opacity(0.68))
          .foregroundColor(.white)
          .cornerRadius(10)
      }
    }
  }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
