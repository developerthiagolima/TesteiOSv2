//
//  CurrencyRouter.swift
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

@objc protocol CurrencyRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CurrencyDataPassing
{
  var dataStore: CurrencyDataStore? { get }
}

class CurrencyRouter: NSObject, CurrencyRoutingLogic, CurrencyDataPassing
{
  weak var viewController: CurrencyViewController?
  var dataStore: CurrencyDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: CurrencyViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: CurrencyDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
