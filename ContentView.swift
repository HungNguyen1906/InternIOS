//
//  ContentView.swift
//  Click Counter
//
//  Created by MaxMobile on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var sliderValue: Double = 3
    @State var color: Color = .green
    @State var toggleIsOn: Bool = false
    var body: some View {
        VStack {
            VStack {
                Button("Click", action: {
                    count += 1
                    print(count)
                  
                })
                Text("Clicks: \(sliderValue)")
                    .font(.title)
                    .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                    
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                //Slider(value: $sliderValue, in: 0...100, step: 1)
                    .foregroundColor(color)
                Slider(
                    value: $sliderValue,
                    in: 1...5,
                    step: 1.0,
                    onEditingChanged: {(_) in
                        color = .green
                    },
                    minimumValueLabel:
                        Text("0")
                        .font(.largeTitle)
                        .foregroundColor(.orange),
                    maximumValueLabel:
                        Text("5")
                        .font(.largeTitle)
                        .foregroundColor(.orange),
                    label: {
                        Text("Title")
                    })
                .accentColor(.green)
                
                Toggle(
                    isOn: $toggleIsOn,
                    label: {
                    Text("Label")
                })
                    
                

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView()
            //.previewInterfaceOrientation(.landscapeLeft)
    }
}
