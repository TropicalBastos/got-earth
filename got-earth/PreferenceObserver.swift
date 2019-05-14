//
//  PreferenceObserver.swift
//  got-earth
//
//  Created by Ian Bastos on 14/05/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import Foundation

class PreferenceObserver {
    
    var defaults: UserDefaults!
    
    init() {
        defaults = UserDefaults.standard
    }
    
    func onUpdate(key: String, value: Any) {
        setValue(value: value, key: key)
    }
    
    func setValue(value: Any, key: String) {
        defaults.set(value, forKey: key)
    }
    
    func checkOption(option: String) {
        defaults.set(true, forKey: option)
    }
    
    func uncheckOption(option: String) {
        defaults.set(false, forKey: option)
    }
    
    func fetchPreference(key: String) -> Any? {
        return defaults.object(forKey: key)
    }
    
    func getUserDefaults() -> UserDefaults {
        return defaults
    }
    
}
