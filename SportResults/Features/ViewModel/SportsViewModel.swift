//
//  SportsViewModel.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine
 
class SportsViewModel: ObservableObject, SportsService, Loadable {
 
  typealias Output = [Comment]
  @Published var state: LoadingState<Output> = .idle
  var apiSession: APISessionProtocol
  
  private var cancellables = Set<AnyCancellable>()
  
  init(apiSession: APISessionProtocol = APISession()) {
    self.apiSession = apiSession
    self.load()
  }
  
  func load() {
    self.state = .loading
    self.sportsCommentsResult()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] result in
        if case .failure(let error) = result {
          self?.state = .failed(error)
        }
    } receiveValue: { items in
      self.state = .loaded(items)
    }.store(in: &cancellables)
  }
}
