//
//  LaunchListtrueLaunchListViewController.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class LaunchListViewController: UIViewController, LaunchListViewInput {

    var output: LaunchListViewOutput!
    
    private var missionList: [LaunchMissionCell.ViewModel] = []
    private let emptyImage = UIImage(systemName: "icloud.slash" )
    private let placeholderImage = UIImage(systemName: "shield")
    private let tableView = UITableView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAll()
        output.viewIsReady()
    }
    
    func setMissions(missions: [LaunchMissionCell.ViewModel]) {
        missionList = missions.reversed()
        tableView.reloadData()
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
    }
    
    private func setupAppereance() {
        view.backgroundColor = . white
    }
    
    private func configureTableView() {
        tableView.register(LaunchMissionCell.self, forCellReuseIdentifier: "launchMissionCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 130
        tableView.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 30,
            right: 0
        )
    }
}

extension LaunchListViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "launchMissionCell",
            for: indexPath
        ) as! LaunchMissionCell

        cell.apply(missionModel: missionList[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionList.count
    }
}

extension LaunchListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.onCellTap(missionInfo: missionList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
