//
//  PopUpView.swift
//  Bullseye
//
//  Created by BankNeo on 2021/05/06.
//

import SwiftUI

struct PopUpView: View {
    @State private var showPopUp = false
    @State private var message = "false"
    
    var body: some View {
        ZStack {
            VStack(spacing: 20){
                Text("Using Z-Stack to create a custom pop up")
                
                Button(action: {
                    self.showPopUp = true
                    self.message = "you pushed the button"
                }, label: {
                    Text("Show custom pop up")
                })
            }.padding()
            if $showPopUp.wrappedValue { //
                PopUp(showPopUp: $showPopUp, message: $message, autoDisappear: true)
            }
            
        }
    }
}
 
struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}

struct PopUp: View {
    @Binding var showPopUp: Bool
    @Binding var message: String
    var autoDisappear = false
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                
                Text("Custom Pop Up\n \(message)")
                    .multilineTextAlignment(.center)
                    .lineSpacing(25)
                Spacer()
                
                Button(action: {
                    self.showPopUp = false
                }, label: {
                    Text("Close")
                })
            }.padding()
        }
        .frame(width: 300, height: 150)
        .cornerRadius(20).shadow(radius: 20)
        .onAppear{
            // Disappear automatically after one second
            if autoDisappear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.showPopUp = false
                }
            }
        }
    }

}
