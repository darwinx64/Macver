//
//  StorageSectionView.swift
//  Macver
//
//  Created by tiramisu on 12/17/24.
//

import SwiftUI

struct StorageSectionView: View {
	private let mountedVolumes: [Volume] = FileManager.default.mountedVolumeURLs(
		includingResourceValuesForKeys: Volume.resourceKeys,
		options: .skipHiddenVolumes
	)?.map(Volume.init) ?? []
	@Environment(\.openURL) private var openURL
	
	var body: some View {
		Section("Storage") {
			ForEach(mountedVolumes) {
				_volumeOverview(
					of: $0
				)
			}
			Button("Storage Settings...") {
				if let storage = URL(string: "x-apple.systempreferences:com.apple.settings.Storage") {
					openURL(storage)
				}
			}
			.frame(maxWidth: .infinity, alignment: .trailing)
		}
	}
	
	@ViewBuilder
	private func _volumeOverview(of volume: Volume) -> some View {
		LabeledContent {
			Text("\(volume.availableCapacity) of \(volume.totalCapacity) available")
		} label: {
			Label {
				Text(volume.name)
			} icon: {
				Image(nsImage: volume.image)
			}
		}
	}
}
