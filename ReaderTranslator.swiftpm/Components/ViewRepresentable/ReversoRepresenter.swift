//
//  WebView.swift
//  PdfTranslate
//
//  Created by Viktor Kushnerov on 9/9/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//

import SwiftUI
import WebKit

struct ReversoRepresenter: ViewRepresentable, WKScriptsSetup {
    @Binding var selectedText: TranslateAction
    private let defaultURL = "https://context.reverso.net/translation/"

    static var coorinator: WKCoordinator?
    static var pageView: WKPageView?

    func makeCoordinator() -> WKCoordinator {
        makeCoordinator(coordinator: WKCoordinator(self, currentView: .reverso))
    }

    func makeView(context: Context) -> WKPageView {
        if let view = Self.pageView { return view }

        let view = WKPageView()
        view.load(urlString: defaultURL)
        Self.pageView = view

        setupScriptCoordinator(view: view, coordinator: context.coordinator)
        setupScript(view: view, file: "reverso")

        return view
    }

    func updateView(_ view: WKPageView, context _: Context) {
        guard case var .reverso(text) = selectedText else { return }
        text = text.replacingOccurrences(of: "\n", with: " ")
        Store.shared.translateAction.next()

        print("\(theClassName)_updateView_update", text)

        let search = text.replacingOccurrences(of: " ", with: "+")
        let groups = view.url?.absoluteString.groups(for: #"\/translation\/(\w+-\w+)\/"#)
        let language = groups?[0][1] ?? "english-russian"
        let urlString = "\(defaultURL)\(language)/\(search)"

        if view.url?.absoluteString == urlString { return }

        if let url = URL(string: urlString.encodeUrl) {
            print("\(theClassName)_updateView_reload", urlString)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                view.load(URLRequest(url: url))
            }
        }
    }
}
