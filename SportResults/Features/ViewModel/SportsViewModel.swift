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
    } receiveValue: { [weak self] items in
      self?.state = .loaded(items)
    }.store(in: &cancellables)
  }
    
    func fetchComments_withCombine() {
      // fetch users -> pick the last one
      // fetch all the posts from the user -> pick the last post
      // fetch all the comments from the last post
        self.allUsers()
            .receive(on: RunLoop.main)
            .flatMap { [weak self] users -> AnyPublisher<[Comment], APIError> in
        if let user = users.last, let this = self {
            return this.sportsCommentsBy(sportsID: "\(user.id)")
        } else {
          return Fail(error: APIError.emptyUsers).eraseToAnyPublisher()
        }
      }.flatMap { [weak self] posts -> AnyPublisher<[Comment], APIError> in
        if let post = posts.last, let this = self {
            return this.sportsCommentsBy(sportsID: "\(post.id)")
        } else {
          return Fail(error: APIError.emptyPosts).eraseToAnyPublisher()
        }
      }.sink { result in
        switch result {
        case .failure(let error):
          print(error.localizedDescription)
        default:
          print("completed!")
        }
      } receiveValue: { [weak self] comments in
          self?.state = .loaded(comments)
      }.store(in: &cancellables)
    }
}
