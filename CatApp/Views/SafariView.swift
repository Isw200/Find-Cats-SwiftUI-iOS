//
//  SafariView.swift
//  CatApp
//
//  Created by Isuru Ariyarathna on 2024-10-23.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
