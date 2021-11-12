//
//  trueLaunchListtrueLaunchListInteractor.swift
//  SpaceXLaunches
//
//  Created by Albrekht Sanda on 11/11/2021.
//  Copyright © 2021 Kinoplan. All rights reserved.
//

import Alamofire

class LaunchListInteractor: LaunchListInteractorInput {

    var missions: [Mission] = []
    weak var output: LaunchListInteractorOutput!
    
    func fetchMissions() {
        AF.request("https://api.spacexdata.com/v3/launches")
            .validate()
            .responseDecodable(of: [Mission].self) { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    self.missions = response.value!
                    print(self.missions)
//                    print(response.result)
                case let .failure(error):
                    print(error)
                }
            }
    }

}
