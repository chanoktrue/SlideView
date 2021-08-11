//
//  ContentView.swift
//  SlideView
//
//  Created by Thongchai Subsaidee on 11/8/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var value: String = "0"
    
    var body: some View {
        

        ZStack {
            
            Color.black
                .ignoresSafeArea(.all)
            
            VStack {
      
                SlideView(value: $value)
                
                TextField("Enter numer 0-100 :", text:  $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SlideView: View {
    
   @Binding var value: String
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask(
                    
                    ZStack {
                        
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: geo.size.width * 0.9, height: 15)
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .position(x: calcSlide(width: geo.size.width), y: geo.frame(in: .local).midY)
                        
                    }
                )
            }
            
        }
    }
    
    func calcSlide( width: CGFloat) -> CGFloat {
        let v = Double(value ) ?? 0.0
        return (CGFloat(v) * width) / 100

    }
}
