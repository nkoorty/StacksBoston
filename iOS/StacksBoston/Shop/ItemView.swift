//
//  ItemView.swift
//  StacksBoston
//
//  Created by Artemiy Malyshau on 27/04/2024.
//

import SwiftUI

struct ItemView: View {
    
    @State private var presentPaymentBTC: Bool = false
    @State private var presentPaymentFIAT: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                HStack(alignment: .center) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text("Search or type URL")
                        
                        Spacer()

                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.bottom, 12)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .offset(y: -6)
                        .padding(.leading, 16)
                }
                
                Image("iphone")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth - 16*2, height: 240)
                    .clipped()
                    .cornerRadius(24)
                    .padding(.bottom, 8)
                    .padding(.vertical, 8)
                
                Text("Apple iPhone 15 Pro")
                    .font(.system(size: 20, weight: .semibold))
                    .hLeading()
                
                HStack(spacing: 12) {
                    Text("Lowest price ").foregroundStyle(.gray) + Text("$530")
                        .font(.system(size: 14))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 2, height: 20)
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    Text("Rating ").foregroundStyle(.gray) + Text("4.5")
                        .font(.system(size: 14))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                Text("Payment options")
                    .font(.system(size: 20, weight: .semibold))
                    .hLeading()
                    .padding(.bottom, 12)
                
                HStack(spacing: 12) {
                    Image("ama")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .cornerRadius(50)
                        .overlay(alignment: .topTrailing) {
                            Image("btc")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                        }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Amazon")
                                .font(.system(size: 18))
                                .bold()
                            
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                        }
                        
                        Text("Free shipping")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)

                    }
                    
                    Spacer()
                    
                    Button {
                        presentPaymentBTC.toggle()
                    } label: {
                        Text("$1149")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.white, lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 12)
                
                HStack(spacing: 12) {
                    Image("ama")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .cornerRadius(50)
                        .overlay(alignment: .topTrailing) {
                            Image("usdc")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                        }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Amazon")
                                .font(.system(size: 18))
                                .bold()
                            
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                        }
                        
                        Text("Free shipping")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        presentPaymentFIAT.toggle()
                    } label: {
                        Text("$1199")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.white, lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 12)

                
                HStack(spacing: 12) {
                    Image("apples")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .cornerRadius(50)
                        .overlay(alignment: .topTrailing) {
                            Image("btc")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                        }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Apple")
                                .font(.system(size: 18))
                                .bold()
                            
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                        }
                        
                        Text("Free shipping")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        presentPaymentBTC.toggle()
                    } label: {
                        Text("$1149")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.white, lineWidth: 2)
                            )
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .sheet(isPresented: $presentPaymentFIAT) {
                PaymentPlanPreviewView(isFiat: true)
            }
            .sheet(isPresented: $presentPaymentBTC) {
                PaymentPlanPreviewView(isFiat: false)
            }
        }
    }
}

#Preview {
    ItemView()
        .preferredColorScheme(.dark)
}
