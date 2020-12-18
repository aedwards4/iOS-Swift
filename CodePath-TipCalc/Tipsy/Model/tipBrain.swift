//
//  tipBrain.swift
//  Tipsy
//
//  Created by Alexis Edwards on 12/18/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct tip{
    let tipString: String
    let tipPercent: Float
    
    init(str: String, p: Float){
        tipString = str
        tipPercent = p
    }
}
