//
//  StatusItemView.swift
//  WhichSpace
//
//  Created by Stephen Sykes on 30/10/15.
//  Copyright © 2020 George Christou. All rights reserved.
//

import Cocoa

class StatusItemCell: NSStatusBarButtonCell {
    
    var isMenuVisible = false
    
    override func drawImage(_ image: NSImage, withFrame frame: NSRect, in controlView: NSView) {
         var darkColor: NSColor
         var whiteColor: NSColor
         if AppDelegate.darkModeEnabled {
             darkColor = NSColor(calibratedWhite: 0.7, alpha: 1)
             whiteColor = NSColor(calibratedWhite: 0, alpha: 1)
         } else {
             darkColor = NSColor(calibratedWhite: 0.3, alpha: 1)
             whiteColor = NSColor(calibratedWhite: 1, alpha: 1)
         }
        let foregroundColor = isMenuVisible ? darkColor : whiteColor
        
        let titleRect = NSRect(x: frame.origin.x, y: frame.origin.y + 3, width: frame.size.width, height: frame.size.height)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        
        let font = NSFont.systemFont(ofSize: 13)
        let attributes = [convertFromNSAttributedStringKey(NSAttributedString.Key.font): font, convertFromNSAttributedStringKey(NSAttributedString.Key.paragraphStyle): paragraphStyle, convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): foregroundColor]
        title.draw(in: titleRect, withAttributes:convertToOptionalNSAttributedStringKeyDictionary(attributes))
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
