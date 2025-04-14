//
//  StorageSectionView.swift
//  Macver
//
//  Created by tiramisu on 12/17/24.
//

import SwiftUI
import ASBridge

struct StorageSectionView: View {
	@State private var volumes: [ASVolumeRecord] = []
	@Environment(\.openURL) private var openURL
	
	var body: some View {
		Section("Storage") {
			ForEach(volumes, id: \.name) {
				_volumeOverview(of: $0)
			}
			Button("Storage Settings...") {
				if let storage = URL(string: "x-apple.systempreferences:com.apple.settings.Storage") {
					openURL(storage)
				}
			}
			.frame(maxWidth: .infinity, alignment: .trailing)
			.onAppear {
				// TODO: yeah
				Timer.scheduledTimer(withTimeInterval: 0, repeats: true) {
					volumes = ASStorageInfo.shared.mountedVolumes as! [ASVolumeRecord]
					if (!volumes.isEmpty) {
						$0.invalidate()
					}
				}
			}
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
