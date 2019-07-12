//
//  ContentView.swift
//  SFExplorer
//
//  Created by Zach Eriksen on 7/12/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import SwiftUI

enum SF: String, CaseIterable {
    // MARK: Circles
    case circle
    case circle_fill
    case circle_lefthalf_fill
    case circle_righthalf_fill
    // MARK: ABC
    case a_circle
    case a_circle_fill
    case b_circle
    case b_circle_fill
    case c_circle
    case c_circle_fill
    case d_circle
    case d_circle_fill
    case e_circle
    case e_circle_fill
    case f_circle
    case f_circle_fill
    case g_circle
    case g_circle_fill
    case h_circle
    case h_circle_fill
    case i_circle
    case i_circle_fill
    case j_circle
    case j_circle_fill
    case k_circle
    case k_circle_fill
    case l_circle
    case l_circle_fill
    case m_circle
    case m_circle_fill
    case n_circle
    case n_circle_fill
    case o_circle
    case o_circle_fill
    case p_circle
    case p_circle_fill
    case q_circle
    case q_circle_fill
    case r_circle
    case r_circle_fill
    case s_circle
    case s_circle_fill
    case t_circle
    case t_circle_fill
    case u_circle
    case u_circle_fill
    case v_circle
    case v_circle_fill
    case w_circle
    case w_circle_fill
    case x_circle
    case x_circle_fill
    case y_circle
    case y_circle_fill
    case z_circle
    case z_circle_fill
    // MARK: Currency
    case dollarsign_circle
    case dollarsign_circle_fill
    case centsign_circle
    case centsign_circle_fill
    case yensign_circle
    case yensign_circle_fill
    case sterlingsign_circle
    case sterlingsign_circle_fill
    case francsign_circle
    case francsign_circle_fill
    case florinsign_circle
    case florinsign_circle_fill
    case turkishlirasign_circle
    case turkishlirasign_circle_fill
    case rublesign_circle
    case rublesign_circle_fill
    case eurosign_circle
    case eurosign_circle_fill
    case dongsign_circle
    case dongsign_circle_fill
    case indianrupeesign_circle
    case indianrupeesign_circle_fill
    case tengesign_circle
    case tengesign_circle_fill
    case pesetasign_circle
    case pesetasign_circle_fill
    case pesosign_circle
    case pesosign_circle_fill
    case kipsign_circle
    case kipsign_circle_fill
    case wonsign_circle
    case wonsign_circle_fill
    case lirasign_circle
    case lirasign_circle_fill
    case australsign_circle
    case australsign_circle_fill
    case hryvniasign_circle
    case hryvniasign_circle_fill
    case nairasign_circle
    case nairasign_circle_fill
    case guaranisign_circle
    case guaranisign_circle_fill
    case coloncurrencysign_circle
    case coloncurrencysign_circle_fill
    case cedisign_circle
    case cedisign_circle_fill
    case cruzeirosign_circle
    case cruzeirosign_circle_fill
    case tugriksign_circle
    case tugriksign_circle_fill
    case millsign_circle
    case millsign_circle_fill
    case sheqelsign_circle
    case sheqelsign_circle_fill
    case manatsign_circle
    case manatsign_circle_fill
    case rupeesign_circle
    case rupeesign_circle_fill
    case bahtsign_circle
    case bahtsign_circle_fill
    case larisign_circle
    case larisign_circle_fill
    case bitcoinsign_circle
    case bitcoinsign_circle_fill
    
    var name: String {
        rawValue.replacingOccurrences(of: "_", with: ".")
    }
    var image: Image {
        Image(systemName: name)
    }
}

struct ContentView : View {
    var body: some View {
        List(SF.allCases.identified(by: \.self)) { sf in
            HStack(alignment: .center) {
                Spacer()
                sf.image
                    .font(.largeTitle)
                Spacer()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
