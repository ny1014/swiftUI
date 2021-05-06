//
//  MVVM.swift
//  Bullseye
//
//  Created by BankNeo on 2021/05/05.
//

import SwiftUI

final class MVVMViewModel: ObservableObject {
    @Published var buttonState: Bool = false
    @Published var input: String = ""
    @Published var message: String = ""
    @Published var size: CGFloat = 21
    @Published var point: CGFloat = 21
    
    
    init() {
        $input
            .map{ $0.isEmpty ? "☺️":"🥶🥶🥶🥶" }
            .assign(to: &$message)
        $buttonState
            .map{ $0 == true ? $0.description + "☺️" : $0.description + "🥶" }
            .assign(to: &$message)
    }
}

struct MVVM: View {
    @ObservedObject var model = MVVMViewModel()
    @State private var showPop = false
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                TextField("输入点什么...", text: $model.input)
                Text("\(model.message)")
                    .bold()
                    .kerning(10)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .font(.system(size: self.model.size))
                
                Button(action: {
                    self.model.buttonState.toggle() //
                    print(self.model.buttonState)
                }) {
                   Text("toggle")
                    .bold()
                    .font(.system(.footnote))
                    .padding()
                    .background(Color(.black))
                    .cornerRadius(13)
                    .foregroundColor(.red)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 20)
                }.padding(.top, 20)
                
                HStack(spacing: 22) {
                    Button(action: {
                        //self.model.size < 40 ? self.model.size += 3 : self.model.size += 0
                        if self.model.size < 40  { self.model.size += 3 }
                        //else { self.model.size = self.model.size }
                    }) {
                        Text("Zoom in")
                            .bold()
                            .font(.system(.footnote))
                            .padding()
                            .background(Color(.blue))
                            .cornerRadius(13)
                            .foregroundColor(.white)
                            .shadow(color: .blue, radius: 20)
                    }
                    Button(action: {
                        if self.model.size > 15 { self.model.size -= 3 }
                    }) {
                        Text("Zoom out")
                            .bold()
                            .font(.system(.footnote))
                            .padding()
                            .background(Color(.red))
                            .cornerRadius(13)
                            .foregroundColor(.blue)
                            .shadow(color: .red, radius: 20)
                    }
                }
                .padding(.all, 20)
                Button(action: {
                    self.showPop = true
                   
                }) {
                   Text("Pop Up！")
                    .bold()
                    .font(.system(.largeTitle))
                    .padding(.all, 22)
                    .background(Color(.yellow))
                    .cornerRadius(20)
                    .foregroundColor(.black)
                }
                Slider(value: $model.size, in: 15...120)
                
                Text("\(self.model.size)")
                
            }.padding()
            
            if showPop {
                PopUp(showPopUp: $showPop, message: $model.message , autoDisappear: true)
            }
           // .background(Color(.green))
        }
    }
}

struct MVVM_Previews: PreviewProvider {
    static var previews: some View {
        MVVM()
        MVVM()
            .previewLayout(.fixed(width: 568, height: 320))
        
    }
}

struct ReusablePopUp: View {
    var body: some View {
        VStack {
            Text("sdasod")
        }
    }
}
