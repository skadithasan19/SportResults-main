//
//  DetailView.swift
//  SportResults
//
//  Created by Adit Hasan on 8/25/23.
//

import SwiftUI

struct DetailView: View {
    var comment: Comment
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(comment.name).font(.title)
            Text(comment.email)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Text(comment.body).font(.callout)
            Spacer()
        }.padding()
    }
}
