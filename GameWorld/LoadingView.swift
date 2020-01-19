//
//  LoadingView.swift
//  GameWorld
//
//  Created by vikas on 28/12/19.
//  Copyright © 2019 VikasWorld. All rights reserved.
//

import Foundation
import SwiftUI
struct LoadingView:UIViewRepresentable  {
    
    func makeUIView(context:UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView{
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        uiView.startAnimating()
    }
}

