//
//  StorageView.swift
//  Macver
//
//  Created by tiramisu on 4/14/25.
//

import SwiftUI

struct StorageView: View {
	var body: some View {
		MVForm {
			StorageSectionView()
		}.tabItem {
			Text("Storage")
		}
	}
}
