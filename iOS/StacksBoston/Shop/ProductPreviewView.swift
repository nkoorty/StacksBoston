import SwiftUI

struct ProductPreviewView: View {
    
    var imageUrl: String
    var name: String
    var price: Double
    var rating: Double
    @State private var isBookmarked: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .overlay(alignment: .topTrailing) {
                            VStack {
                                HStack(spacing: 2) {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 12, height: 12)
                                    
                                    Text(String(format: "%.1f", rating))
                                        .font(.system(size: 12))
                                }
                                .foregroundStyle(.black)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(.white)
                                .cornerRadius(50)
                                .padding([.top, .bottom, .trailing], 6)
                                
                                Spacer()
                                    .frame(height: 60)
                                
                                Button {
                                    isBookmarked.toggle()
                                } label: {
                                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 18, height: 18)
                                        .foregroundStyle(.black)
                                        .padding(10)
                                        .background(.white)
                                        .cornerRadius(50)
                                        .padding([.top, .bottom, .trailing], 6)
                                }
                                
                            }
                            
                        }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .bold()
                    
                    Text("$" + String(format: "%.2f", price))
                        .font(.system(size: 14))
                }
                .padding()
                .hLeading()
                .frame(width: 140, height: 60)
                .background(Color(.darkGray).brightness(-0.2))
            }
        }
        .cornerRadius(18)
    }
}

#Preview {
    ProductPreviewView(imageUrl: "coke", name: "Coke", price: 25.99, rating: 3.9)
        .preferredColorScheme(.dark)
}
