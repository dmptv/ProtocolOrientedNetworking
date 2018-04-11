//
//  ViewController.swift
//  PON
//
//  Created by 123 on 11.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    var dataSource = [Food]() {
        didSet {
//            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // passing in a default food service
        getFood(fromService: FoodService() )
    }
    
    // constrain to receive a Gettable that has [Food] as it’s associated type
    func getFood<Service: Gettable>(fromService service: Service) where Service.Data == [Food] {
        service.get() { [weak self] result in
            
            switch result {
            case .Success(let food):
                dataSource = food
                showSucces(food)
            case .Failure(let error):
                self?.showError(error)
            }
        }
    }
    
    func showSucces(_ food: [Food]) {
        print("succes count food", food.count)
    }

    func showError(_ err: Error) {
        print("failure getting food")
    }
  


}














