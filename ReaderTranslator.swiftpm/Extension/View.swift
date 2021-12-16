//
//  View.swift
//  ReaderTranslator
//
//  Created by Viktor Kushnerov on 10/2/19.
//  Copyright © 2019 Viktor Kushnerov. All rights reserved.
//
import SwiftUI

extension View {
    var any: AnyView {
        .init(self)
    }

    var theClassName: String {
        String(describing: type(of: self))
    }
}
