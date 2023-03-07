//
//  SearchCardController.swift
//  PokemoniOS
//
//  Created by Marlon Von Bernales Ansale on 07/03/2023.
//

import UIKit
import PokemonFeed

public final class SearchCardController: NSObject {
    public typealias ResourceViewModel = UIImage
    private let viewModel: SearchCardViewModel
    private let delegate: ImageControllerDelegate
    private var cell: SearchCardCollectionCell?
    private let selection: () -> Void
    
    public init(viewModel: SearchCardViewModel,
                delegate: ImageControllerDelegate,
                cell: SearchCardCollectionCell? = nil,
                selection: @escaping () -> Void) {
        
        self.viewModel = viewModel
        self.delegate = delegate
        self.cell = cell
        self.selection = selection
    }
    
    private func cancel() {
        delegate.didCancelImageRequest()
        releaseCellForReuse()
    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
    
    private func requestImage(){
        delegate.didRequestImage()
    }

}

extension SearchCardController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell?.titleLabel.text = viewModel.name
        cell?.priceLabel.text = viewModel.price
        cell?.cardImageView.image = nil
        requestImage()
        return cell!
    }
}

extension SearchCardController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.cell = cell as? SearchCardCollectionCell
        requestImage()
    }
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cancel()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selection()
    }
}

extension SearchCardController: ResourceView, ResourceLoadingView, ResourceErrorView {
    public func display(_ viewModel: UIImage) {
        cell?.cardImageView.setImageAnimated(viewModel)
    }
    
    public func display(_ viewModel: ResourceLoadingViewModel) {
        cell?.cardImageView.isShimmering = viewModel.isLoading
    }
    
    public func display(_ viewModel: ResourceErrorViewModel) {
        if viewModel.message != nil {
            cell?.cardImageView.setImageAnimated(UIImage.placeholder(type: Self.self))
        }
    }
}
