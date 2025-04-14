//
//  FormWrapper.swift
//  Macver
//
//  Created by samara on 13.04.2025.
//

import SwiftUI

struct MVForm<Content>: View where Content: View {
	var _content: Content
	
	init(@ViewBuilder content: () -> Content) {
		self._content = content()
	}
	
	var body: some View {
		Form {
			_content
		}
		.scrollContentBackground(.hidden)
		.formStyle(.grouped)
	}
}
