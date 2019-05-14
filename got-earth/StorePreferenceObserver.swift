//
//  StorePreferenceObserver.swift
//  got-earth
//
//  Created by Ian Bastos on 14/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import Foundation

class StorePreferenceObserver : PreferenceObserver {
    
    static let DEFAULTS_PREFIX = "store_"
    
    override func onUpdate(key: String, value: Any) {
        setValue(value: value, key: StorePreferenceObserver.DEFAULTS_PREFIX + key)
    }
    
    override func setValue(value: Any, key: String) {
        defaults.set(value, forKey: key)
    }
    
    override func checkOption(option: String) {
        defaults.set(true, forKey: StorePreferenceObserver.DEFAULTS_PREFIX + option)
    }
    
    override func uncheckOption(option: String) {
        defaults.set(false, forKey: StorePreferenceObserver.DEFAULTS_PREFIX + option)
    }
    
    override func fetchPreference(key: String) -> Any? {
        return defaults.object(forKey: StorePreferenceObserver.DEFAULTS_PREFIX + key)
    }
    
}
