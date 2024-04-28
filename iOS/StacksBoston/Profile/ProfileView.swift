//
//  ProfileView.swift
//  StacksBoston
//
//  Created by Artemiy Malyshau on 26/04/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 20) {
                        Image("icon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 72, height: 72)
                            .cornerRadius(50)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Artemiy M.")
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("Complete profile")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .padding(.top, 20)
                
                Section {
                    VStack {
                        Image(systemName: "bookmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.top, 12)
                        
                        Text("Nothing saved, yet!")
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("Save items, get notified when the price drops")
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 12)
                        
                        Button {
                             
                        } label: {
                            Text("Start searching")
                                .foregroundStyle(.black)
                                .font(.system(size: 18))
                                .frame(width: 330, height: 48)
                                .background(.white)
                                .cornerRadius(50)
                        }
                        
                    }
                    .hCenter()
                } header: {
                    Text("Saved items")
                }
                .headerProminence(.increased)
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("My brands")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("My reviews")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("My services")
                            .padding(.vertical, 2)
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Invite friends")
                        
                        Spacer()
                            .frame(width: 60)
                        
                        Text("Earn $10 in BTC")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.white)
                            .cornerRadius(50)

                    }
                }
                
                Section {
                    Button {
                        UserDefaults.standard.set(false, forKey: "signin")
                    } label: {
                        Text("Log out")
                            .foregroundStyle(.red)
                    }
                } header: {
                    Text("Disconnect")
                }
            }
            .navigationTitle("You")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "message.badge")
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
        
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
