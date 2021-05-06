//
//  ClientSearchView.swift
//  Bullseye
//
//  Created by BankNeo on 2021/05/06.
//

import SwiftUI

struct ClientSearchView: View {
    @State private var title: String = "2222"
    @State private var clicked: Bool = false
    @State var selectedClient: String = ""
    @State private var searchByname: String = ""
    
    var body: some View {
        VStack {
        TopBar(titleName: "顧客検索")
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        VStack {
            HStack(spacing: 10) {
                clientTap(clicked: $clicked, selectedClient: $selectedClient, title:"顧客番号検索")
                clientTap(clicked: $clicked, selectedClient: $selectedClient, title:"担当者検索")
                clientTap(clicked: $clicked, selectedClient: $selectedClient, title:"顧客名検索")
            }
          
            
            Text("dddd")
            SearchNameView(searchByname: $searchByname, selected: $clicked)
            Spacer()
        }
    }
    }
}

struct ClientSearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClientSearchView()
                .previewDevice("iPhone 12")
//            ClientSearchView()
//                .previewDevice("iPhone 7")
//            ClientSearchView()
//                .previewDevice("iPhone 6s")
        }
    }
}


//radio

struct clientTap: View {
    @Binding var clicked: Bool
    @State var textBg: Color = Color.white
    @Binding var selectedClient: String
    var title: String
    @State var textColor: Color = Color.black
    
    
    var body: some View {
        
        Button(action: {
            self.selectedClient = title //選択した値を空箱に入れる
           clicked = true
        }, label: {
            Text(title)
                .padding(.all, 12)
                .foregroundColor(self.selectedClient == title  ? Color.white : Color.black)
                .background(self.selectedClient == title  ? Color.green : Color.white)
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(Color.black))
        })
        
    }
}


struct TopBar: View {
    var titleName: String
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Spacer()
                Text(titleName).font(.system(size: 20)).fontWeight(.light).foregroundColor(.white)
                Spacer()
            }
        }
        .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
        .background(Color.green)
    }
}

//顧客検査画面
struct SearchNameView: View {
   // @EnvironmentObject var viewModel: AccountsListModel
    @Binding var searchByname: String
    @Binding var selected: Bool
    
    var body: some View {
        HStack{
            Text("顧客名").padding(.vertical,10)
                .padding(.horizontal, 5)
                .background(Color(red: 153 / 255, green: 217 / 255, blue: 234 / 255))
            TextField("顧客名を入力", text: $searchByname)
                .frame(height: 40)
               .textFieldStyle(PlainTextFieldStyle())
               .padding([.leading, .trailing], 4)
               .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
        }.frame(height: 50)
        //検索ボタン
        Button(action: {
            //-TOTO: 22
             
        }) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                Text("検索").frame(height:40)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .accentColor(.white)
        .background(Color.green)
        .cornerRadius(10)
    }
}
