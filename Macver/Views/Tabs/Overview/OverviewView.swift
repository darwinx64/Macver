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
			StorageSectionView()
		}.tabItem {
			Text("Overview")
		}
	}
}

#Preview {
	OverviewView()
}
