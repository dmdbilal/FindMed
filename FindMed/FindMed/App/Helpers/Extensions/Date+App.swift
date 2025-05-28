//
// Date+App.swift
// FindMed
//
// Created by Mohamed Bilal on 16/05/25
//

import Foundation

extension Date {
    var daysAgo: String {
        let currentDate = Date()
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: currentDate)
        
        if let daysDifference = components.day {
            print("Difference in days: \(daysDifference)")
            return "\(daysDifference)"
        }
        
        fatalError("Unable to calculate days difference")
    }
    
    func toCustomFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        
        // "h a, d MMM yyyy" -> Format for day, month, and year
        dateFormatter.dateFormat = format
        
        dateFormatter.amSymbol = "AM"   // Set the symbol for AM
        dateFormatter.pmSymbol = "PM"   // Set the symbol for PM
        
        // Get the formatted date string
        let formattedDate = dateFormatter.string(from: self)
        
        // Extract the day to add ordinal suffix
        let day = Calendar.current.component(.day, from: self)
        let ordinalSuffix: String
        
        switch day {
        case 11, 12, 13: ordinalSuffix = "th" // Special case for 11th, 12th, 13th
        default:
            switch day % 10 {
            case 1: ordinalSuffix = "st"
            case 2: ordinalSuffix = "nd"
            case 3: ordinalSuffix = "rd"
            default: ordinalSuffix = "th"
            }
        }
        
        // Replace the day in the formatted string with the day + ordinal suffix
        let dayString = "\(day)\(ordinalSuffix)"
        return formattedDate.replacingOccurrences(of: "\(day)", with: dayString)
    }
}
