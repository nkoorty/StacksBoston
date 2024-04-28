import SwiftUI
import LocalAuthentication

struct CollaterizeView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Collaterize your BTC as a de facto deposit that we will hold in an Escrow until you have paid all instalments")
                    .hLeading()
                    .padding(.bottom, 16)
                
                Button {
                    authenticate()
                } label: {
                    HStack {
                        Image("btc")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("Collaterize")
                            .bold()
                    }
                }
                .frame(width: UIScreen.screenWidth - 16*2, height: 52)
                .background(.orange.opacity(0.6))
                .cornerRadius(18)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Collaterize")
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
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        presentationMode.wrappedValue.dismiss()
                    }
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

//#Preview {
//    CollaterizeView()
//        .preferredColorScheme(.dark)
//}
