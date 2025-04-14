//
//  OverviewView.swift
//  Macver
//
//  Created by tiramisu on 12/16/24.
//

import SwiftUI
import ASIBridge
import ASBridge
import MachO

struct OverviewView: View {
	@State private var serialHovered = false
	
	private let appleSilicon = NXGetLocalArchInfo().pointee.cputype == CPU_TYPE_ARM64
	@State private var fuck = ASStorageInfo.shared.mountedVolumes as! [ASVolumeRecord]
	
	var body: some View {
		MVForm {
			LabeledContent(appleSilicon ? "Chip" : "Processor", value: "\(ASI_CopyCurrentCPUDescription().takeUnretainedValue())")
			
			if !appleSilicon, let gpu = ASDisplayHardwareInfo.shared.mainGfxDisplayName {
				LabeledContent("Graphics", value: gpu)
			}
			
			LabeledContent("Memory", value: "\(ASI_CopyCurrentRAMDescriptionWithType().takeUnretainedValue())")
			
			LabeledContent("Serial number") {
				Text("\(ASI_CopyFormattedSerialNumber().takeUnretainedValue())")
					.onHover {
						serialHovered = $0
					}
					.blur(radius: !serialHovered ? 4 : 0)
					.animation(.spring, value: serialHovered)
			}
			
			// TODO: temp
			Section("Storage") {
				ForEach(fuck) {
					_volumeOverview(of: $0)
				}
				HStack {
					Spacer()
					Button("Storage Settings...") {
						
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

#Preview {
	OverviewView()
}
