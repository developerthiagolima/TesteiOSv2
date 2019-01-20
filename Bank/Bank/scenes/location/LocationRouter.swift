//
//  LocationRouter.swift
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

@objc protocol LocationRoutingLogic {
    func routeToCurrency(segue: UIStoryboardSegue?)
}

protocol LocationDataPassing {
    var dataStore: LocationDataStore? { get }
}

class LocationRouter: NSObject, LocationRoutingLogic, LocationDataPassing {
    weak var viewController: LocationViewController?
    var dataStore: LocationDataStore?
    
    func routeToCurrency(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! CurrencyViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        }
    }
    
    func passDataToSomewhere(source: LocationDataStore, destination: inout CurrencyDataStore) {
        destination.userAccount = source.userAccount
    }
}