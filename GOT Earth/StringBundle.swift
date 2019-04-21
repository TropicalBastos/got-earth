//
//  JsonUtils.swift
//  GOT Earth
//
//  Created by Ian Bastos on 21/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit
import SceneKit

class StringBundle: NSObject {
    
    var bundle: [String : Any]!
    
    init(locale: String) {
        super.init()
        loadJson(localeUrl: locale)
    }
    
    func getByKey(_ key: String) -> [String : Any] {
        return bundle[key] as! [String : Any]
    }
    
    func hasKey(_ key: String) -> Bool {
        return bundle[key] != nil
    }
    
    func getNodeWithKey(node: SCNNode) -> SCNNode? {
        guard let name = node.name else { return nil }
        
        if (hasKey(name)) {
            return node
        }
        
        if (node.parent == nil) {
            return nil
        }
        
        return getNodeWithKey(node: node.parent!)
    }
    
    func loadJson(localeUrl: String) {
        let url = Bundle.main.url(forResource: localeUrl, withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            self.bundle = try JSONSerialization.jsonObject(with: jsonData) as! [String : Any]
        }
        catch {
            print(error)
        }
    }

}
