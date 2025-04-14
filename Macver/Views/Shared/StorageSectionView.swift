//
//  StorageSectionView.swift
//  Macver
//
//  Created by tiramisu on 12/17/24.
//

import SwiftUI
import ASBridge

struct StorageSectionView: View {
	@State private var volumes = ASStorageInfo.shared.mountedVolumes as! [ASVolumeRecord]
	@Environment(\.openURL) private var openURL
	
	var body: some View {
		Section("Storage") {
			ForEach(volumes) {
				_volumeOverview(of: $0)
			}
			Button("Storage Settings...") {
				if let storage = URL(string: "x-apple.systempreferences:com.apple.settings.Storage") {
					openURL(storage)
				}
			}.frame(maxWidth: .infinity, alignment: .trailing)
		}
	}
	
	@ViewBuilder
	private func _volumeOverview(of volume: ASVolumeRecord) -> some View {
		LabeledContent {
			Text("\(volume.sizeAvailable) of \(volume.sizeTotal) available")
		} label: {
			Label {
				Text(volume.name)
			} icon: {
				Image(nsImage: volume.image)
			}
		}
	}
}
