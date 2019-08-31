//
//  ContentView.swift
//  SFExplorer
//
//  Created by Zach Eriksen on 7/12/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI
import SF

struct SFExplorerEditor: View {
    private let foregroundColors: [Color] = [.white, .red, .orange, .yellow, .green, .blue, .purple, .black]
    private let backgroundColors: [Color] = [.black, .white, .red, .orange, .yellow, .green, .blue, .purple]
    private let fonts: [Font] = [.largeTitle, .title, .headline, .body, .callout,  .subheadline, .footnote, .caption]
    let symbol: SF
    
    @State private var foregroundColor: Int = 0
    @State private var backgroundColor: Int = 0
    @State private var currentFont: Int = 0
    @State private var foregroundColorEnabled: Bool = false
    @State private var backgroundColorEnabled: Bool = false
    @State private var textExampleEnabled: Bool = false
    @State private var textExampleInput: String = "Hello World!"
    @State private var backgroundCornerRadius: CGFloat = 0
    @State private var width: CGFloat = 200
    @State private var height: CGFloat = 200
    @State private var opacity: Double = 1
    @State private var rotation: Double = 0
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    
    var imageView: some View {
            symbol.image
                .resizable()
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(foregroundColors[foregroundColor])
                .rotationEffect(.degrees(rotation))
                .opacity(opacity)
                .offset(x: xOffset, y: yOffset)
                .background(backgroundColors[backgroundColor]
                    .cornerRadius(backgroundCornerRadius))
                .font(fonts[currentFont])
                .padding()
    }
    
    var symbolView: some View {
        VStack {
            
            imageView
            
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
    
    var foregroundControlsView: some View {
        Section {
            Toggle(isOn: $foregroundColorEnabled) {
                Text("ForgroundColor")
            }
            .accentColor(foregroundColors[foregroundColor])
            if foregroundColorEnabled {
                Picker(selection: $foregroundColor, label: Text("Color")) {
                    ForEach(0 ..< foregroundColors.count) {
                        self.foregroundColors[$0].tag($0)
                    }
                }
            }
        }
    }
    
    var backgroundControlsView: some View {
        Section {
            Toggle(isOn: $backgroundColorEnabled) {
                Text("BackgroundColor")
            }
            .accentColor(backgroundColors[backgroundColor])
            if backgroundColorEnabled {
                Picker(selection: $backgroundColor, label: Text("Color")) {
                    ForEach(0 ..< backgroundColors.count) {
                        self.backgroundColors[$0].tag($0)
                    }
                }
            }
            HStack {
                Text("Background CornerRadius")
                Spacer()
                Slider(value: $backgroundCornerRadius, in: (0 ... 100))
            }
        }
    }
    
    var boundsControlViews: some View {
        Section {
            HStack {
                Text("Width")
                Spacer()
                Slider(value: $width, in: (1 ... 300))
            }
            HStack {
                Text("Height")
                Spacer()
                Slider(value: $height, in: (1 ... 300))
            }
            HStack {
                Text("Opacity")
                Spacer()
                Slider(value: $opacity, in: (0 ... 1), step: 0.01)
            }
            HStack {
                Text("Rotation")
                Spacer()
                Slider(value: $rotation, in: (0 ... 360))
            }
            HStack {
                Text("X Offset")
                Spacer()
                Slider(value: $xOffset, in: (-150 ... 150))
            }
            HStack {
                Text("Y Offset")
                Spacer()
                Slider(value: $yOffset, in: (-150 ... 150))
            }
        }
    }
    
    var body: some View {
        VStack {
            
            symbolView
            
            Divider()
            List {
                foregroundControlsView
                backgroundControlsView
                boundsControlViews
            }
        }
    }
}

struct ContentView : View {
    var body: some View {
        NavigationView {
            List(SF.allCases, id: \.self) { element in
                NavigationLink(destination: SFExplorerEditor(symbol: element)) {
                    HStack {
                        Spacer()
                        Text(element.name)
                        element.image
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("SFExplorer")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

