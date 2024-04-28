//
//  TabBarView.swift
//  StacksBoston
//
//  Created by Artemiy Malyshau on 26/04/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "bag.fill")
                }
            
            PurchasesView()
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
}
