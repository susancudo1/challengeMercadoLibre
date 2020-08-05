//
//  LoadingView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 5/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 16)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(Color(.systemYellow), lineWidth: 8)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(
                    Animation
                        .linear(duration: 2)
                        .repeatForever(autoreverses: false))
                .onAppear(){
                    self.isLoading = true
            }
            
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
