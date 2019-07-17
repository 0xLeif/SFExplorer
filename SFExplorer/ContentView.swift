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
    @State private var foregroundCornerRadius: Length = 0
    @State private var backgroundCornerRadius: Length = 0
    @State private var width: Length = 200
    @State private var height: Length = 200
    @State private var opacity: Double = 1
    @State private var rotation: Double = 0
    @State private var xOffset: Length = 0
    @State private var yOffset: Length = 0
    
    var imageView: some View {
        HStack {
            if textExampleEnabled {
                symbol.image
                    //                    .cornerRadius(foregroundCornerRadius)
                    .foregroundColor(foregroundColors[foregroundColor])
                    .rotationEffect(.degrees(rotation))
                    .opacity(opacity)
                    .offset(x: xOffset, y: yOffset)
                    .background(backgroundColors[backgroundColor]
                        .cornerRadius(backgroundCornerRadius))
                Text(textExampleInput)
            } else {
                symbol.image
                    .resizable()
                    //                    .cornerRadius(foregroundCornerRadius)
                    .frame(width: width, height: height, alignment: .center)
                    .foregroundColor(foregroundColors[foregroundColor])
                    .rotationEffect(.degrees(rotation))
                    .opacity(opacity)
                    .offset(x: xOffset, y: yOffset)
                    .background(backgroundColors[backgroundColor]
                        .cornerRadius(backgroundCornerRadius))
            }
        }
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
            //            HStack {
            //                Text("Foreground CornerRadius")
            //                Spacer()
            //                Slider(value: $foregroundCornerRadius, from: 0, through: 300, by: 1)
            //            }
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
                Slider(value: $backgroundCornerRadius, from: 0, through: 100, by: 1)
            }
        }
    }
    
    var boundsControlViews: some View {
        Section {
            HStack {
                Text("Width")
                Spacer()
                Slider(value: $width, from: 1, through: 300, by: 1)
            }
            HStack {
                Text("Height")
                Spacer()
                Slider(value: $height, from: 1, through: 300, by: 1)
            }
            HStack {
                Text("Opacity")
                Spacer()
                Slider(value: $opacity, from: 0, through: 1, by: 0.01)
            }
            HStack {
                Text("Rotation")
                Spacer()
                Slider(value: $rotation, from: 0, through: 360, by: 1)
            }
            HStack {
                Text("X Offset")
                Spacer()
                Slider(value: $xOffset, from: -150, through: 150, by: 1)
            }
            HStack {
                Text("Y Offset")
                Spacer()
                Slider(value: $yOffset, from: -150, through: 150, by: 1)
            }
        }
    }
    
    var textControlView: some View {
        Section {
            Picker(selection: $currentFont, label: Text("Font")) {
                ForEach(0 ..< fonts.count) {
                    Text("Hello World!")
                        .font(self.fonts[$0]).tag($0)
                }
            }
            Toggle(isOn: $textExampleEnabled) {
                Text("TextExample")
            }
            if textExampleEnabled {
                TextField("", text: $textExampleInput)
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
                textControlView
            }
        }
    }
}

struct ContentView : View {
    var body: some View {
        NavigationView {
            List(SF.allCases.reversed().identified(by: \.self)) { sf in
                NavigationLink(destination: SFExplorerEditor(symbol: sf)) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text(sf.name)
                        sf.image
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

