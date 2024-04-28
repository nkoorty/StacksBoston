import SwiftUI

struct FIATPaymentPlanView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedInstalment = "4"

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
                
                Text("$1,273.94")
                    .font(.system(size: 22, weight: .semibold))
                    .hCenter()
                    .padding(.bottom, 32)

                Text("Complete your purchase")
                    .font(.system(size: 22, weight: .bold))
                    .hLeading()
                    .padding(.bottom, 0)

                HStack {
                    Text(selectedInstalment + " interest-free payments")
                        .font(.system(size: 18, weight: .regular))
                        .hLeading()

                    Spacer()
                    
                    Menu {
                        Button("2") { selectedInstalment = "2" }
                        Button("4") { selectedInstalment = "4" }
                        Button("6") { selectedInstalment = "6" }
                    } label: {
                        Text("Change")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
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
                            Text("No interest, pay using Fiat.")
                                .bold()
                            
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
                    .font(.system(size: 22, weight: .bold))
                    .hLeading()
                    .padding(.bottom, 4)
                
                Text("In order to complete your purchase, you need to collaterize a specified amount of BTC. Complete this action below")
                    .font(.system(size: 16, weight: .regular))
                    .hLeading()
                    .padding(.bottom, 12)
                
                
                Text("Collaterise $1300 (0.000016 BTC)")
                    .font(.system(size: 16, weight: .bold))
                    .hCenter()
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(.white.opacity(0.1))
                    .cornerRadius(18)
                    .padding(.bottom, 6)
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 340, height: 1)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.bottom, 6)

                
                Text("Continue to payment")
                    .font(.system(size: 16, weight: .bold))
                    .hCenter()
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(.white.opacity(0.1))
                    .cornerRadius(18)

                
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
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.white).bold()
                            .padding(9)
                            .background(.white.opacity(0.2))
                            .cornerRadius(50)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FIATPaymentPlanView()
        .preferredColorScheme(.dark)
}
