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
import Kingfisher

class LaunchListViewController: UIViewController, LaunchListViewInput {

    var output: LaunchListViewOutput!
    var missionListVM: [LaunchMissionCell.ViewModel] = []
    
    private let emptyImage = UIImage(systemName: "icloud.slash" )
    private let placeholderImage = UIImage(systemName: "shield")
    private let tableView = UITableView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
       
        setupAll()
    }

    // MARK: LaunchListViewInput
    func setupInitialState() {
    }
    
    func passViewModels(cellViewModels: [LaunchMissionCell.ViewModel]) {
        missionListVM = cellViewModels.reversed()
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

extension LaunchListViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "launchMissionCell",
            for: indexPath
        ) as! LaunchMissionCell

        cell.apply(model: missionListVM[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionListVM.count
       }
}

extension LaunchListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        output.cellTapped(missionInfo: missionListVM[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension String {
    func formatDate() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withDashSeparatorInDate
        ]
        guard let isoDate = isoDateFormatter.date(from: self) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMMM, yyy"
    
        return dateFormatter.string(from: isoDate)
        }
    }



