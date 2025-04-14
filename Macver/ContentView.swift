//
//  ContentView.swift
//  Macver
//
//  Created by tiramisu on 12/15/24.
//

import SwiftUI
import ASIBridge

struct ContentView: View {
    var body: some View {
        HStack {
			SideView()
			TabView {
				OverviewView()
				DisplaysView()
				StorageView()
				MemoryView()
            }
        }
		.frame(width: 840)
        .background(VisualEffectView().ignoresSafeArea())
    }
}

struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let effectView = NSVisualEffectView()
        effectView.state = .active
        return effectView
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}

#Preview {
    ContentView()
}
