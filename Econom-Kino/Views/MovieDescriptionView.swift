//
//  MovieDescriptionView.swift
//  Econom-Kino
//
//  Created by Slavik on 11.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct MovieDescriptionView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 7) {
            HStack {
                Text("Вік:").font(.system(size: 18, weight: .medium))
                Text("18+").font(.system(size: 18))
            }
            HStack {
                Text("Режисер:").font(.system(size: 18, weight: .medium))
                Text("Ярослав Кухар").font(.system(size: 18))
            }
            HStack {
                Text("Imdb:").font(.system(size: 18, weight: .medium))
                Text("6.8").font(.system(size: 18))
            }
            HStack {
                Text("Жанр:").font(.system(size: 18, weight: .medium))
                Text("Бойовик, Комедія").font(.system(size: 18))
            }
            HStack {
                Text("Тривалість:").font(.system(size: 18, weight: .medium))
                Text("118 хв.").font(.system(size: 18))
            }
            HStack {
                Text("Виробництво:").font(.system(size: 18, weight: .medium))
                Text("США, Україна").font(.system(size: 18))
            }
            HStack {
                Text("18.05.2020:").font(.system(size: 18, weight: .medium))
                Text("18.05.2020").font(.system(size: 18))
            }

           
            VStack {
                VStack (alignment: .leading, spacing: -5) {
                    Text("Студія:").font(.system(size: 18, weight: .medium))
                    ScrollView(.horizontal) {
                        HStack {
                            HorisontalNamesView(name: "SSHI")
                            HorisontalNamesView(name: "Politech")
                            HorisontalNamesView(name: "EK-Team")
                        }.padding(.vertical, 12)
                    }
                } // Studios
                VStack (alignment: .leading, spacing: -5) {
                    Text("У головних ролях:").font(.system(size: 18, weight: .medium))
                    ScrollView(.horizontal) {
                        HStack {
                            HorisontalNamesView(name: "Ярослав Кухар")
                            HorisontalNamesView(name: "Любомир Черещук")
                            HorisontalNamesView(name: "Павло Марій")
                            HorisontalNamesView(name: "Марко Бурак")
                        }.padding(.vertical, 12)
                    }
                } // Main roles
            }
            
            Text("Опис: ").font(.system(size: 18, weight: .medium))
            Text("Блискуча екранізація світового бестселера Джейн Остін! Емма - молода, багата і самовпевнена. Вона переконана, що відмінно розбирається в людях і найбільше любить зводити пари. Невтомна Емма завжди готова до милих романтичних розчарувань і безрозсудних вчинків. Втім одного разу її припущення дає тріщину - ідеальна пара не клеїться! А між іншим, вона ще повинна розпізнати власну любов, яка завжди була поруч.")
            
        }.padding()
            .foregroundColor(Color.mainBlack)
    }
}

struct MovieDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionView()
    }
}
