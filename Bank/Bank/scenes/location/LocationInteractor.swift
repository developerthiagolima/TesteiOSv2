//
//  LocationInteractor.swift
//  Bank
//
//  Created by Thiago Lima on 19/01/19.
//  Copyright (c) 2019 SantanderTecnologia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LocationBusinessLogic {
    func login(_ request: Location.Login.Request)
}

protocol LocationDataStore {
    var userAccount: Location.UserAccount? { get set }
}

class LocationInteractor: LocationBusinessLogic, LocationDataStore {
    var presenter: LocationPresentationLogic?
    var worker: LocationWorker?
    var userAccount: Location.UserAccount?
    
    func login(_ request: Location.Login.Request) {
        worker = LocationWorker()
        worker?.login(user: request.user!, password: request.password, responseRequest: { response in
            self.userAccount = response.userAccount
            self.presenter?.presentLoginResults(response: response)
        })
    }
}
