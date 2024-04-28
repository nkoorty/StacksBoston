import SwiftUI

struct PaymentPlanPreviewView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedInstalment = "4"
    @State var isFiat: Bool = false
    @State private var presentCollaterize: Bool = false
    @State private var presentSafari: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Buy iPhone 15 Pro")
                    .font(.system(size: 24, weight: .bold))
                    .hLeading()
                    .padding(.bottom, 16)
                
                Text("Total incl. taxes")
                    .font(.system(size: 18, weight: .regular))
                    .hCenter()
                
                Text(isFiat ? "$1,273.93" : "$1,220.81")
                    .font(.system(size: 22, weight: .semibold))
                    .hCenter()
                    .padding(.bottom, 32)

                Text("Complete your purchase")
                    .font(.system(size: 20, weight: .bold))
                    .hLeading()
                    .padding(.bottom, 0)

                HStack {
                    Text(selectedInstalment + " interest-free payments")
                        .font(.system(size: 16, weight: .regular))
                        .hLeading()

                    Spacer()
                    
                    Menu {
                        Button("2") { selectedInstalment = "2" }
                        Button("4") { selectedInstalment = "4" }
                        Button("6") { selectedInstalment = "6" }
                    } label: {
                        Text("Change")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.white.opacity(0.2))
                            .cornerRadius(20)
                    }
                }
                .padding(.bottom, 16)
                

                VStack {
                    VStack {
                        HStack(spacing: 0) {
                            InstalmentView(isFinal: false)
                            InstalmentView(isFinal: false)
                            InstalmentView(isFinal: false)
                            InstalmentView(isFinal: true)
                            
                            Spacer()
                        }
                        .padding(.bottom, 32)
                        
                        HStack {
                            (Text("No interest, pay using ") + Text(isFiat ? "USD." : "BTC."))
                                .bold()
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            Image(systemName: "info.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.gray)
                        }
                    
                        
                    }
                    .padding(24)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 160)
                .background(.white.opacity(0.1))
                .cornerRadius(18)
                .padding(.bottom, 12)
                
                Text("Collaterize Bitcoin")
                    .font(.system(size: 20, weight: .bold))
                    .hLeading()
                    .padding(.bottom, 4)
                
                Text("In order to complete your purchase, you need to collaterize a specified amount of BTC. Complete this action below")
                    .font(.system(size: 14, weight: .regular))
                    .hLeading()
                    .padding(.bottom, 12)
                
                
                Button {
                    presentCollaterize.toggle()
                } label: {
                    Text(isFiat ? "Collaterise $1350 (0.04 BTC)" : "Collaterise $1300 (0.038 BTC)")
                        .font(.system(size: 16, weight: .bold))
                        .hCenter()
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(.white.opacity(0.1))
                        .cornerRadius(18)
                        .padding(.bottom, 6)
                }
                
                HStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 150, height: 1)
                        .foregroundStyle(.gray.opacity(0.6))
                        .padding(.bottom, 6)
                    
                    Text("THEN")
                        .foregroundStyle(.gray.opacity(0.6))
                        .font(.system(size: 14, weight: .semibold))
                        .offset(y: -4)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 150, height: 1)
                        .foregroundStyle(.gray.opacity(0.6))
                        .padding(.bottom, 6)
                }

                
                Text("Continue to payment")
                    .font(.system(size: 16, weight: .bold))
                    .hCenter()
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(.white.opacity(0.1))
                    .cornerRadius(18)
                    .onTapGesture {
                        presentSafari.toggle()
                    }

                
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.white).bold()
                            .padding(8)
                            .background(.white.opacity(0.2))
                            .cornerRadius(50)
                    }
                }
            }
            .padding(.horizontal, 16)
            .sheet(isPresented: $presentCollaterize) {
                CollaterizeView()
                    .presentationDetents([.fraction(0.4)])
            }
            .fullScreenCover(isPresented: $presentSafari, content: {
                    SFSafariViewWrapper(url: URL(string: "https://www.amazon.com/Apple-iPhone-256GB-Natural-Titanium/dp/B0CRJSBN5M/ref=sr_1_4?crid=HFGQA19IRAIB&dib=eyJ2IjoiMSJ9.jL39oZuzoU2JWwuZxnH6UZSPMx0rVI-wiFOwv5hfhU70TiOPA6Dmp5SE8EyMzFUpBZm-uLkvvEQqFOBDbzoaKsE37rBnqsYUcX2bKHCzrAC-OR4m6nbx_x1sQA07huTa8LZQTfWpgimUVyVlcMTzWwPtdDs3V0uHrnvH4SCXEnZnjhZATjrCshOZJRlmvCYck-iXCSFVJXZIF3OJx1t625sJMFPccJO7zWW1w0EitAo.zQHNI7LQxTW3BGp5oGIJ7Zx2auteE0WN7PtmMv2u8G0&dib_tag=se&keywords=iphone%2B15%2Bpro&qid=1714312119&sprefix=iphone%2B15%2Bpro%2Caps%2C115&sr=8-4&th=1")!)
            })
        }
    }
}

struct InstalmentView: View {
    var isFinal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("$305.20")
                .font(.system(size: 16, weight: .bold))
            
            Text("Today")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.gray)
                .padding(.bottom, 12)
            
            Rectangle()
                .frame(width: 80, height: 4)
                .foregroundStyle(isFinal ? .clear : .gray)
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 16, height: 16)
                }
        }
    }
}

#Preview {
    PaymentPlanPreviewView(isFiat: true)
        .preferredColorScheme(.dark)
}
