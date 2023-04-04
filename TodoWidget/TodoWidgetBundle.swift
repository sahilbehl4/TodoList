//
//  TodoWidgetBundle.swift
//  TodoWidget
//
//  Created by Sahil Behl on 3/31/23.
//

import WidgetKit
import SwiftUI

@main
struct TodoWidgetBundle: WidgetBundle {
    var body: some Widget {
        TodoWidget()
        TodoWidgetLiveActivity()
    }
}
