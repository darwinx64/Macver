//
//  MemoryView.swift
//  Macver
//
//  Created by tiramisu on 12/17/24.
//

import SwiftUI

struct MemoryView: View {
	var body: some View {
		VStack {
			Form {
				HStack(spacing: 20) {
					VStack {
						RoundedRectangle(cornerRadius: 7)
						RoundedRectangle(cornerRadius: 7)
					}.opacity(0.5)
					VStack(alignment: .leading, spacing: 10, content: {
						Text("**16 GB** Installed")
						Text("Your Mac contains 2 memory slots, each of which accepts a 3200 MHz DDR4 memory module.")
						Text("All memory slots are currently in use.")
					})
				}
			}
			.scrollContentBackground(.hidden)
			.formStyle(.grouped)
		}
	}
}

#Preview {
	MemoryView()
}
