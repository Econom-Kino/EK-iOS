//
//  BlurView.swift
//  Econom-Kino
//
//  Created by Slavik on 23.04.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    public var style: UIBlurEffect.Style
    public var cornerRadius: CGFloat?
    
    public init(_ style: UIBlurEffect.Style, cornerRadius: CGFloat? = nil) {
        self.style = style
        self.cornerRadius = cornerRadius
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        if let cornerRadius = self.cornerRadius {
            uiView.clipsToBounds = true
            uiView.layer.cornerRadius = cornerRadius
        }
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(.dark)
    }
}
