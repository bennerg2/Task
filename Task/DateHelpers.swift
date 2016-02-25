//
//  DateHelpers.swift
//  Task
//
//  Created by Benjamin Thomas Gurrola on 2/16/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

extension NSDate {
    func toString() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        return formatter.stringFromDate(self)
    }
}
