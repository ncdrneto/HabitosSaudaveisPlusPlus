//
//  AreaDaSaude.swift
//  HabitosSaudaveisPlusPlusCode
//
//  Created by Newton Cardoso da Rocha Neto on 16/05/24.
//

import Foundation

enum AreaDaSaude: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case saudeBucal = "Saúde Bucal"
    case saúdeDoCoracao = "Saúde do Coração"
    
  
}
