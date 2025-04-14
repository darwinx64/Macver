//
//  Volume.swift
//  Macver
//
//  Created by tiramisu on 4/14/25.
//

import Foundation
import AppKit

class Volume: Identifiable {
	
	let url: URL
	
	static let resourceKeys: [URLResourceKey] = [
		.volumeLocalizedNameKey,
		.volumeTotalCapacityKey,
		.volumeAvailableCapacityKey
	]
	
	lazy private var resources: URLResourceValues = {
		try! url.resourceValues(forKeys: .init(Volume.resourceKeys))
	}()
	
	lazy var name: String = resources.volumeLocalizedName ?? url.path
	lazy var totalCapacity: String = resources.volumeTotalCapacity?.formatted(.byteCount(style: .file)) ?? ""
	lazy var availableCapacity: String = resources.volumeAvailableCapacity?.formatted(.byteCount(style: .file)) ?? ""
	lazy var image: NSImage = { NSWorkspace.shared.icon(forFile: url.path) }()
	
	var id: Self { self }
	
	init(url: URL) {
		self.url = url
	}
}
