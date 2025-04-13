//
//  AppDelegate.swift
//  Macver
//
//  Created by tiramisu on 12/15/24.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(_ notification: Notification) {
		NSApp.setActivationPolicy(.accessory)
		if let window = NSApplication.shared.windows.first {
			window.standardWindowButton(.zoomButton)?.isHidden = true
			window.standardWindowButton(.miniaturizeButton)?.isHidden = true
			window.isMovableByWindowBackground = true
			window.toolbarStyle = .unified
			
#if DEBUG
			window.level = .floating
#endif
		}
	}
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}
