//
//  WindowController.swift
//  TouchBarSample
//
//  Created by Hung Truong on 10/27/16.
//  Copyright © 2016 Hung Truong. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("com.hung-truong.TouchBarSample")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let one     = NSTouchBarItemIdentifier("one")
    static let three      = NSTouchBarItemIdentifier("three")
    static let seven   = NSTouchBarItemIdentifier("seven")
}


class WindowController: NSWindowController, NSTouchBarDelegate {

    func handleBarButton(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
        touchBar.defaultItemIdentifiers     = [.one, .fixedSpaceSmall, .three, .fixedSpaceSmall, .seven]
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)
        touchBarItem.view   = NSButton(title: identifier.rawValue, target: self, action: #selector(handleBarButton))
        return touchBarItem
    }
}
