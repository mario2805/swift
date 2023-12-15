//
//  Texts.swift
//  Red Dead
//
//  Created by User on 15/09/23.
//

import Foundation
import SwiftUI
struct Texts: View {
    var body: some View{
        
        
        VStack(spacing: 35){
            Text("For redemption")
                .font(.system(size: 44))
                .foregroundColor(.black)
                .italic()
                .bold()
                .offset(y: 20)
            
            Text("Kill him!")
                .font(.system(size: 29))
                .foregroundColor(.black)
                .italic()
                .bold()
            
            Button{
                
            }label: {
                Text("shoot")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                    .padding(.horizontal,40)
                    .background(Color.orange)
                    .background(Color.clear)
                    .cornerRadius(50)
                    .offset(y: 20)
            }
        }
    }
}
