//
//  DropView.swift
//  Bullseye
//
//  Created by BankNeo on 2021/05/06.
//

import SwiftUI


final class DropViewModel: ObservableObject {
    @Published var input = ""
    
}

struct DropView: View {
    
    @ObservedObject private var viewModel = DropViewModel()
    
    var body: some View {
        VStack {
            TextField("Drop field", text: $viewModel.input)
                .frame(height: 35)
                .multilineTextAlignment(.trailing)
                .padding([.leading, .trailing], 10)
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.black))
            
        
        }
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView()
    }
}
