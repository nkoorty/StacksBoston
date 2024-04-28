import SwiftUI

struct PurchasesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Purchases")
                    .font(.system(size: 26, weight: .bold))
                    .hLeading()
                
                VStack(spacing: 8) {
                    Text("Total you owe")
                        .font(.system(size: 16))
                        .hLeading()
                        .padding(.top, 16)
                    
                    HStack {
                        Text("$890")
                            .font(.system(size: 28)).bold()
                            .padding(.bottom, 12)
                        
                        Text("0.014 BTC")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(.gray)
                            .offset(y: -4)
                        
                        Spacer()
                    }
                    
                    Text("Total collaterized")
                        .font(.system(size: 16))
                        .hLeading()
                    
                    HStack {
                        Text("$2400")
                            .font(.system(size: 28)).bold()
                            .padding(.bottom, 12)
                        
                        Text("0.04 BTC")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(.gray)
                            .offset(y: -4)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "hand.point.right.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(8)
                            .background(.black)
                            .cornerRadius(8)
                        
                        Text("Manage payments")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Image(systemName: "bolt.shield.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(8)
                            .background(.black)
                            .cornerRadius(8)
                        
                        Text("Track Deliveries")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                    }
                    
                    HStack {
                        Image(systemName: "arrow.uturn.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(8)
                            .background(.black)
                            .cornerRadius(8)
                        
                        Text("Manage returns & refunds")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                    }

                    Spacer()
                }
                .padding(.top, 12)
                .padding(24)
                .frame(maxWidth: .infinity, minHeight: 320, maxHeight: 320)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                
                Image(systemName: "sparkles")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.top, 24)
                
                Text("Some purchases not visible?\nImport them.")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text("Connecr your wallet to track your order in one app")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding(.top, 6)

                
                Spacer()
            }
            .padding(.horizontal, 16)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

#Preview {
    PurchasesView()
        .preferredColorScheme(.dark)
}
