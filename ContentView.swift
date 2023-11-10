//
//  ContentView.swift
//  candace007
//
//  Created by User on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Texts()
                
                HStack {
                    
                    Image("arthur1")
                        .resizable()
                        .frame(width:790, height:550)
                        .cornerRadius(10)
                        .edgesIgnoringSafeArea(.all)
                        .offset(x: 35, y: 40)
                    
                }
            }
        }
    }
}

