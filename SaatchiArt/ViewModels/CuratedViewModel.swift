//
//  CuratedViewModel.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/23/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation

let json = """
[
{
"name": "Courtroom 600.ii",
"price": "160",
"url": "https://vietnamtravel.deals/wp-content/uploads/2016/02/5330703404_5251623633_b.jpg",
"artist": {
"userId": "1",
"userName": "nhatle"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "1This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your work.2This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your work.3This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your work.4This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your work.5 This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your 6666 This component of the description will need to refer directly to the artwork at hand. There's no perfect formula for this, however it does need to be engaging! Remember that it should reflect you and your personality, as well as your enthusiasm for your work. 7777 END ENDeee1234567890"
},
{
"name": "Unitiled",
"price": "880",
"url": "https://www.citypassguide.com/media/slideshow/0-bao-dai-summer-palace-in-dalat-vietnam-da-lat.jpg",
"artist": {
"userId": "2",
"userName": "Ginny Elston"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "It’s worth spending a little more time on this component to ensure that you have every possible factor that the customer could wish to know.\\nMaterials used – include canvas type, materials used e.g. pastels or pencils\\nDimensions – include these incentimetres and inches for extra clarity\\nPackaging - explain your packaging process. Will the work be packed in bubble wrap or rolled? Do you offer to ship artworks both rolled and stretched?\\n12345End"
},
{
"name": "Unitiled2",
"price": "890",
"url": "https://cdn3.ivivu.com/2013/09/du-lich-da-lat-ivivu.com-3.jpg",
"artist": {
"userId": "3",
"userName": "Ginny Elston"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "It’s worth spending a little more time on this component to ensure that you have every possible factor that the customer could wish to know.\\nMaterials used – include canvas type, materials used e.g. pastels or pencils\\nDimensions – include these incentimetres and inches for extra clarity\\nPackaging - explain your packaging process. Will the work be packed in bubble wrap or rolled? Do you offer to ship artworks both rolled and stretched?"
},
{
"name": "Courtroom 600.ii",
"price": "160",
"url": "https://vietnamtravel.deals/wp-content/uploads/2016/02/5330703404_5251623633_b.jpg",
"artist": {
"userId": "1",
"userName": "nhatle"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "It’s worth spending a little more time on this component to ensure that you have every possible factor that the customer could wish to know.\\nMaterials used – include canvas type, materials used e.g. pastels or pencils\\nDimensions – include these incentimetres and inches for extra clarity\\nPackaging - explain your packaging process. Will the work be packed in bubble wrap or rolled? Do you offer to ship artworks both rolled and stretched?"
},
{
"name": "Unitiled",
"price": "880",
"url": "https://www.citypassguide.com/media/slideshow/0-bao-dai-summer-palace-in-dalat-vietnam-da-lat.jpg",
"artist": {
"userId": "2",
"userName": "Ginny Elston"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "It’s worth spending a little more time on this component to ensure that you have every possible factor that the customer could wish to know.\\nMaterials used – include canvas type, materials used e.g. pastels or pencils\\nDimensions – include these incentimetres and inches for extra clarity\\nPackaging - explain your packaging process. Will the work be packed in bubble wrap or rolled? Do you offer to ship artworks both rolled and stretched?"
},
{
"name": "Unitiled2",
"price": "890",
"url": "https://cdn3.ivivu.com/2013/09/du-lich-da-lat-ivivu.com-3.jpg",
"artist": {
"userId": "3",
"userName": "Ginny Elston"
},
"place" : "Germany",
"style": "Painting",
"metarial": "Acrylic",
"size": "36.0 H x 36.0W x 1.5 in",
"favoriteCount": 22,
"viewCount": 156,
"artDesciption": "It’s worth spending a little more time on this component to ensure that you have every possible factor that the customer could wish to know.\\nMaterials used – include canvas type, materials used e.g. pastels or pencils\\nDimensions – include these incentimetres and inches for extra clarity\\nPackaging - explain your packaging process. Will the work be packed in bubble wrap or rolled? Do you offer to ship artworks both rolled and stretched?"
}
]
"""


struct CuratedViewModel {
    func loadData() -> [ArtModel]{
        do {
            return try dummyData()
        }catch let err {
            print(err)
            return []
        }
    }
    
    private func dummyData() throws -> [ArtModel] {
        let jsonDecoder = JSONDecoder()
        let data1 = json.data(using: .utf8)
        let imageModels = try jsonDecoder.decode([ArtModel].self, from: data1!)
        return imageModels
    }
}

func dummy() throws -> [ArtModel] {
    let jsonDecoder = JSONDecoder()
    let data1 = json.data(using: .utf8)
    let imageModels = try jsonDecoder.decode([ArtModel].self, from: data1!)
    return imageModels
}
