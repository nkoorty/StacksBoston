//
//  HomeView.swift
//  StacksBoston
//
//  Created by Artemiy Malyshau on 26/04/2024.
//

import SwiftUI

struct ShopView: View {

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Good Afternoon")
                            .font(.system(size: 24)).bold()
                            .hLeading()
                        
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .bold()
                    }
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Search & Shop")
                        
                        Spacer()
                        
                        Image(systemName: "doc.on.doc")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.white)
                    .cornerRadius(25)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 16)
                    
                    ZStack(alignment: .topLeading) {
                        Image("iphone15")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, minHeight: 272, maxHeight: 272)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Trending \nTech")
                                .font(.system(size: 34, weight: .heavy))
                                .foregroundStyle(.black)

                            
                            Text("Find brands \nleading the \nBitcoin revolution")
                                .padding(.bottom, 34)
                                .foregroundStyle(.black)
                            
                            HStack {
                                Text("See all")
                                    .foregroundStyle(.white)
                                
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(.white)
                            }
                            .font(.system(size: 14)).bold()
                            .foregroundStyle(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.black)
                            .cornerRadius(50)
                        }
                        .padding(.leading, 24)
                        .padding(.top, 16)
                    }
                    .cornerRadius(25)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Features stores")
                            .font(.system(size: 24)).bold()
                            .hLeading()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.system(size: 14)).bold()
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        FeaturedStorePreviewView(image: "ama", name: "Amazon")
                        FeaturedStorePreviewView(image: "apples", name: "Apple")
                        FeaturedStorePreviewView(image: "nike", name: "Nike")
                        FeaturedStorePreviewView(image: "ebay", name: "Ebay")
                        FeaturedStorePreviewView(image: "shein", name: "Shein")
                    }
                    .padding(.bottom, 24)
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Popular products")
                            .font(.system(size: 24)).bold()
                            .hLeading()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.system(size: 14)).bold()
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "iphone", name: "iPhone 15 Pro", price: 1149.99, rating: 4.6)
                            }
                            
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "airpods", name: "AirPods Pro", price: 249.99, rating: 4.4)
                            }
                            
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "airpodsmax", name: "AirPods Max", price: 549.99, rating: 4.2)
                            }
                        }

                    }
                    .contentMargins(.horizontal, 16)
                    .padding(.bottom, 24)

                    
                    HStack {
                        Text("Trending on sale")
                            .font(.system(size: 24)).bold()
                            .hLeading()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("View all")
                                .font(.system(size: 14)).bold()
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "xm5", name: "Sony XM5", price: 349.99, rating: 4.5)
                            }
                            
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "bose", name: "Bose 700", price: 269.99, rating: 4.3)
                            }
                            
                            NavigationLink {
                                ItemView()
                            } label: {
                                ProductPreviewView(imageUrl: "apple_watch", name: "Apple Watch Series 9", price: 449.99, rating: 4.8)
                            }
                        }

                    }
                    .contentMargins(.horizontal, 16)
                    .padding(.bottom, 24)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ShopView()
        .preferredColorScheme(.dark)
}
