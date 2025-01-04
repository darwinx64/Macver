//
//  OverviewView.swift
//  Macver
//
//  Created by paige on 12/16/24.
//

import SwiftUI
import ASIBridge
import ASBridge

struct OverviewView: View {
    var body: some View {
        Form {
            LabeledContent("Processor", value: "\(ASI_CopyCurrentCPUDescription().takeUnretainedValue())")
            if let gpu = ASDisplayHardwareInfo().mainGfxDisplayName() {
                LabeledContent("Graphics", value: gpu)
            }
            LabeledContent("Memory", value: "\(ASI_CopyCurrentRAMDescriptionWithType().takeUnretainedValue())")
            LabeledContent("Serial number") {
                Text("\(ASI_CopyFormattedSerialNumber().takeUnretainedValue())")
                    .monospaced()
            }
            
            // TODO: temp
            Section("Storage") {
                LabeledContent {
                    Text("512 GB available of 1 TB")
                } label: {
                    Label {
                        Text("Macintosh HD")
                    } icon: {
                        Image(nsImage: NSWorkspace.shared.icon(forFile: "/"))
                    }
                }
                HStack {
                    Spacer()
                    Button("Storage Settings...") {
                        
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .formStyle(.grouped)
    }
}

#Preview {
    OverviewView()
}
