//
//  ASVolumeRecord+Id.swift
//  Macver
//
//  Created by tiramisu on 4/13/25.
//

import ASBridge

extension ASVolumeRecord: Identifiable {
	public var id: String {
		name
	}
}
