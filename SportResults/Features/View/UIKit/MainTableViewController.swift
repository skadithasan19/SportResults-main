//
//  MainTableViewController.swift
//  SportResults
//
//  Created by Adit Hasan on 9/9/23.
//

import UIKit
import SwiftUI
import Combine

struct WrappedView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UITableViewController
    func makeUIViewController(context: Context) -> UITableViewController {
        MainTableViewController()
    }
    
    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {}
}

class MainTableViewController: UITableViewController {

    private var viewModel = SportsViewModel()
    
    var comments:[Comment] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 45
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { [weak self] mainState in
                switch mainState {
                case .loaded(let output):
                    self?.comments = output
                    break
                case .loading:
                    print("Loading..")
                case .idle:
                    print("idle..")
                case .failed(let error):
                    print(error.localizedDescription)
                }
            }.store(in: &cancellables)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        let comment = comments[indexPath.row]
        cell.textLabel?.text = comment.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.detailTextLabel?.text = comment.body
        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
