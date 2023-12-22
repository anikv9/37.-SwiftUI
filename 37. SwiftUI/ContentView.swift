//
//  ContentView.swift
//  37. SwiftUI
//
//  Created by ani kvitsiani on 23.12.23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var image1Tapped = false
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAmount3 = Angle.zero
    @State private var finalAmount3 = Angle.zero
    
    var body: some View {
        VStack {
            HStack {
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .onTapGesture (count: 2) {
                        print ("Double tapped!")
                    }
                
                Image("image2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .scaleEffect(finalAmount + currentAmount)
                    .gesture(MagnificationGesture()
                        .onChanged { amount in
                            currentAmount = amount - 1
                        }
                        .onEnded{amount in
                            
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                    )
            }

            HStack {
                Image("image3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .gesture(
                    RotationGesture()
                        .onChanged { angle in
                        currentAmount3 = angle
                        }
                        .onEnded { angle in
                            finalAmount3 += currentAmount3
                            currentAmount3 = .zero
                            
                        }
                    )

                Image("image4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .onLongPressGesture(minimumDuration: 5) {
                        print("hold")
                    }
            }

            Image("image5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
