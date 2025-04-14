//
//  SideView.swift
//  Macver
//
//  Created by tiramisu on 12/16/24.
//

import SwiftUI
import ASBridge

// TODO: temp(?)
func getSysctlValue(_ name: String) -> String {
	var size = 0
	sysctlbyname(name, nil, &size, nil, 0)
	var machine = [CChar](repeating: 0,  count: size)
	sysctlbyname(name, &machine, &size, nil, 0)
	return String(cString: machine)
}

func isHackintosh() -> Bool {
	let task = Process()
	task.executableURL = URL(filePath: "/usr/sbin/kextstat")
	
	let pipe = Pipe()
	task.standardOutput = pipe

	try? task.run()
	
	let data = pipe.fileHandleForReading.readDataToEndOfFile()
	let output = String(data: data, encoding: .utf8)!
	
	return output.contains("VirtualSMC") || output.contains("FakeSMC") || output.contains("Lilu") || output.contains("WhateverGreen")
}

struct SideView: View {
	var body: some View {
		VStack(spacing: 40) {
			Image(
				"AboutThisMacRoundel",
				bundle: .init(identifier: "com.apple.preferences.SystemDesktopAppearance")!
			)
			
			VStack(spacing: 5) {
				Text(ASPlatformInfo.shared.osTitleString)
					.font(.largeTitle)
				VStack {
					Text("\(ProcessInfo.processInfo.operatingSystemVersionString)")
					Text("\(getSysctlValue("kern.ostype")) \(getSysctlValue("kern.osrelease"))")
					
					if isHackintosh() {
						Text("Hackintosh")
					}
				}.foregroundStyle(.secondary).font(.callout)
			}
		}
		.padding(40)
		.padding(.vertical, 20)
	}
}

#Preview {
	ContentView()
}
