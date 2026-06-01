
import SwiftUI








struct SubjectStatisticsTileView: View {
    
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var radius: CGFloat = 0

    var body: some View {
       
        VStack{
            
        }
        .frame(width: width, height: height)
        .background(.secondary)// удалить
        .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
      
        
        
        
        
    }
}




#Preview {
    SubjectStatisticsTileView(width: 360, height: 187, radius: 20)
}
