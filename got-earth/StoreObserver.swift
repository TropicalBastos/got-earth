//
//  StoreObserver.swift
//  got-earth
//
//  Created by Ian Bastos on 18/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import Foundation
import StoreKit

class StoreObserver : NSObject, SKPaymentTransactionObserver {
    
    //Initialize the store observer.
    override init() {
        super.init()
        //Other initialization here.
    }
    
    //Observe transaction updates.
    func paymentQueue(_ queue: SKPaymentQueue,updatedTransactions transactions: [SKPaymentTransaction]) {
        //Handle transaction states here.
    }
    
}
