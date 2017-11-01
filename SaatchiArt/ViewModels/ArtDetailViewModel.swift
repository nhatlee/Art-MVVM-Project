//
//  ArtDetailViewModel.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
enum ArtDetailViewModelItemType {
    case ArtImage
    case ArtInfo
    case ArtActios
}

protocol ArtDetailViewModelProtocol {
    var type: ArtDetailViewModelItemType {get}
    var rowCount: Int {get}
}

final class ArtDetailViewModel: NSObject {
    var artObject: ArtModel?
    var items = [ArtDetailViewModelProtocol]()
    init(_ art: ArtModel) {
        artObject = art
        if let imageUrl = art.url{
           let artImageItem = ArtDetailViewModelImage(imageUrl)
            items.append(artImageItem)
        }
        let artInfoItem = ArtDetailViewModelInfor(art)
        items.append(artInfoItem)
        let artActionsItem = ArtDetailViewModelActions()
        items.append(artActionsItem)
    }
}

extension ArtDetailViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .ArtImage:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArtImageCell.identifier, for: indexPath) as? ArtImageCell {
                cell.item = item
                return cell
            }
        case .ArtInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArtInfoCell.identifier, for: indexPath) as? ArtInfoCell{
                cell.item = item
                return cell
            }
        case .ArtActios:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArtActionsCell.identifier, for: indexPath) as? ArtActionsCell {
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension ArtDetailViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section]
        switch item.type {
        case .ArtImage:
            return 260
        case .ArtInfo:
            return ArtInfoCell.cellHight(item)
        case .ArtActios:
            return 80
        }
    }
}

final class ArtDetailViewModelImage: ArtDetailViewModelProtocol {
    var type: ArtDetailViewModelItemType {
        return .ArtImage
    }
    var rowCount: Int {
        return 1
    }
    var pictureUrl: String
    init(_ urlString: String) {
        pictureUrl = urlString
    }
}

final class ArtDetailViewModelInfor: ArtDetailViewModelProtocol {
    var type: ArtDetailViewModelItemType {
        return .ArtInfo
    }
    var rowCount: Int {
        return 1
    }
    var artObj: ArtModel
    
    init(_ art: ArtModel) {
        artObj = art
    }
}

final class ArtDetailViewModelActions: ArtDetailViewModelProtocol {
    var type: ArtDetailViewModelItemType {
        return .ArtActios
    }
    var rowCount: Int {
        return 1
    }
}
