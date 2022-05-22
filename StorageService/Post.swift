//
//  Publications.swift
//  collection
//
//  Created by Даниил Сокол on 26.03.2022.
//

import Foundation
import UIKit

struct Post {
    let author : String
    let image : UIImage
    let description : String
    let likes : Int
    let views : Int
    
    static func publications() -> [Post] {
        var publications = [Post]()
        publications.append(Post(author: "Первый канал", image: UIImage(named: "первый")!, description: "Первый канал, самый посещаемый телеканал в России", likes: 438, views: 4735))
        publications.append(Post(author: "НТВ", image: UIImage(named: "нтв")!, description: "«НТВ» — общероссийский федеральный телеканал. Вещает круглосуточно из Москвы, из телецентра «Останкино». Входит в первый мультиплекс цифрового телевидения России. Также вещают временны́е дубли для трансляции на регионы России", likes: 853, views: 7523))
        publications.append(Post(author: "ТНТ", image: UIImage(named: "тнт")!, description: "«ТНТ» — российский федеральный телеканал. По данным на 2021 год занимает восьмое место по популярности среди телеканалов России. Целевая аудитория телеканала — телезрители от 14 до 44 лет, ядро составляет молодёжь — зрители 18—30 лет.", likes: 535, views: 264))
        publications.append(Post(author: "СТС", image: UIImage(named: "стс")!, description: "«СТС» — российский федеральный телеканал. Принадлежит холдингу «СТС Медиа». Телеканал СТС, начав своё вещание 1 декабря 1996 года, стал первой российской телевизионной сетью. Аналоговый сигнал телеканала распространяется либо посредством собственных местных станций, либо через региональных партнёров.", likes: 253, views: 1745))
        
        return publications
    }
}

