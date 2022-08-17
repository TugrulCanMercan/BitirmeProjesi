//
//  PromotionSectionView.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 13.04.2022.
//

import SwiftUI
import UIKit

struct PromotionSectionView: View {
    
    
    
    var body: some View {
        VStack{
            TTPromotionBar()
            List{
                ForEach(1...3, id: \.self ){idx in
                    HStack{
                        VStack{
                            Text("junior")
                            Text("junior")
                        }
                    }

                }
            }
        }
    }
}

struct PromotionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionSectionView()
        
    }
}


