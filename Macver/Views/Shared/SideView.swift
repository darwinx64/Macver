//
//  SideView.swift
//  Macver
//
//  Created by tiramisu on 12/16/24.
//

import SwiftUI
import CUIBridge

// TODO: temp(?)
func getSysctlValue(_ name: String) -> String {
	var size = 0
	sysctlbyname(name, nil, &size, nil, 0)
	var machine = [CChar](repeating: 0,  count: size)
	sysctlbyname(name, &machine, &size, nil, 0)
	return String(cString: machine)
}

// TODO: might be a better way idk; see Hackintool?
func isHackintosh() -> Bool {
	let task = Process()
	task.executableURL = URL(fileURLWithPath: "/usr/sbin/kextstat")
	
	let pipe = Pipe()
	task.standardOutput = pipe
	task.standardError = pipe
	
	do {
		try task.run()
		let data = pipe.fileHandleForReading.readDataToEndOfFile()
		let output = String(data: data, encoding: .utf8)
		
		if let output = output, output.contains("VirtualSMC") || output.contains("FakeSMC") || output.contains("Lilu") || output.contains("WhateverGreen") {
			return true
		}
	} catch {
		print("\(error)")
	}
	
	return false
}

// TODO: temp
public extension ProcessInfo {
	func osName() -> String? {
		let version = self.operatingSystemVersion
		switch version.majorVersion {
			case 15: return "Sequoia"
			case 14: return "Sonoma"
			case 13: return "Ventura"
			case 12: return "Monterey"
			case 11: return "Big Sur"
			case 10: break
			default: return "\(version.majorVersion)"
		}
		switch version.minorVersion {
			case 15: return "Catalina"
			case 14: return "Mojave"
			case 13: return "High Sierra"
			case 12: return "Sierra"
			case 11: return "El Capitan"
			case 10: return "Yosemite"
			case 9: return "Mavericks"
			case 8: return "Mountain Lion"
			case 7: return "Lion"
			case 6: return "Snow Leopard"
			case 5: return "Leopard"
			case 4: return "Tiger"
			case 3: return "Panther"
			case 2: return "Jaguar"
			case 1: return "Puma"
			case 0: return "Cheetah"
			default: return nil
		}
	}
}

struct SideView: View {
	var body: some View {
		VStack(spacing: 40) {
			if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
				Image("PreviewEmpty", bundle: Bundle.main)
			} else {
				if let catalog = CUICatalog(url: URL(fileURLWithPath: "/System/Library/PrivateFrameworks/SystemDesktopAppearance.framework/Versions/A/Resources/Assets.car"), error: nil) {
					if let namedImage = catalog.image(withName: "AboutThisMacRoundel", scaleFactor: 0.75) {
						if let image = namedImage.image {
							Image(nsImage: NSImage(cgImage: image, size: NSZeroSize))
						}
					}
				}
			}
			
			VStack(spacing: 5) {
				Text("macOS \(ProcessInfo.processInfo.osName() ?? "")")
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
