//
//  String+Ext.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/7/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
}
