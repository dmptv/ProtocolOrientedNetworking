//
//  FoodService.swift
//  PON
//
//  Created by 123 on 11.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

struct Food {
    
}

struct ErrorType: Error {
    
}

// as a container for two types
enum Result<T> {
    case Success(T)
    case Failure(ErrorType)
}

protocol Gettable {
    associatedtype Data
    
    func get(completionHandler: (Result<Data>) -> Void)
}

// API request
struct FoodService: Gettable {
     typealias Data = [Food]
    
    func get(completionHandler: (Result<[Food]>) -> Void) {
        // make asynchronous API call
        // and return appropriate result
        
        let num = arc4random_uniform(1000) + 1
        if num % 2 != 0 {
            completionHandler(Result.Success( [Food()] ))
        } else {
            completionHandler(Result.Failure( ErrorType() ))
        }
    }

}
















