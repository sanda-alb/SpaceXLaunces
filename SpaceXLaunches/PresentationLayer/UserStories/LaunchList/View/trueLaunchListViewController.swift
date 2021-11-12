//
//  LaunchListtrueLaunchListViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class LaunchListViewController: UIViewController, LaunchListViewInput {
    
    private let tableView = UITableView()
    var output: LaunchListViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        setupAll()
        
    }


    // MARK: LaunchListViewInput
    func setupInitialState() {
    }
    
    private func setupAll() {
        embedViews()
        setupLayout()
        setupAppereance()
        configureTableView()
    }

    private func embedViews() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    private func setupAppereance() {
        view.backgroundColor = . white
   
    }
    
    private func configureTableView() {
        tableView.register(LaunchMissionCell.self, forCellReuseIdentifier: "launchMissionCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension LaunchListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "launchMissionCell",
            for: indexPath
        ) as! LaunchMissionCell

        
//        cell.label.text = personInfo[indexPath.row].title
//        cell.image.image = personInfo[indexPath.row].photo
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section
       }
    
}

