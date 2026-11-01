//
//  MarkdownView+Representable.swift
//  MarkdownView
//
//  Created by 秋星桥 on 2026/2/1.
//

import SwiftUI

#if canImport(UIKit)
    import UIKit

    struct MarkdownViewRepresentable: UIViewRepresentable, MarkdownViewRepresentableBase {
        let contentSource: MarkdownView.ContentSource
        let theme: MarkdownTheme
        let isStreaming: Bool?

        func makeUIView(context _: Context) -> MarkdownTextView {
            createMarkdownTextView()
        }

        func updateUIView(_ uiView: MarkdownTextView, context: Context) {
            updateMarkdownTextView(uiView, coordinator: context.coordinator)
        }

        @available(iOS 16.0, macOS 13.0, tvOS 16.0, *)
        func sizeThatFits(
            _ proposal: ProposedViewSize,
            uiView: MarkdownTextView,
            context: Context,
        ) -> CGSize? {
            context.coordinator.sizeThatFits(proposal, for: uiView)
        }

        func makeCoordinator() -> MarkdownViewCoordinator {
            MarkdownViewCoordinator()
        }
    }

#elseif canImport(AppKit)
    import AppKit

    struct MarkdownViewRepresentable: NSViewRepresentable, MarkdownViewRepresentableBase {
        let contentSource: MarkdownView.ContentSource
        let theme: MarkdownTheme
        let isStreaming: Bool?

        func makeNSView(context _: Context) -> MarkdownTextView {
            createMarkdownTextView()
        }

        func updateNSView(_ nsView: MarkdownTextView, context: Context) {
            updateMarkdownTextView(nsView, coordinator: context.coordinator)
        }

        @available(iOS 16.0, macOS 13.0, tvOS 16.0, *)
        func sizeThatFits(
            _ proposal: ProposedViewSize,
            nsView: MarkdownTextView,
            context: Context,
        ) -> CGSize? {
            context.coordinator.sizeThatFits(proposal, for: nsView)
        }

        func makeCoordinator() -> MarkdownViewCoordinator {
            MarkdownViewCoordinator()
        }
    }
#endif
