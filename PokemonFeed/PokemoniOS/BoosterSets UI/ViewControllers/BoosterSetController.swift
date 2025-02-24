//
//  BoosterSetController.swift
//  PokemoniOS
//
//  Created by Marlon Ansale on 1/3/23.
//

import UIKit
import PokemonFeed

public final class BoosterSetController: NSObject {
    public typealias ResourceViewModel = UIImage
    private let viewModel: BoosterSetViewModel
    private let delegate: ImageControllerDelegate
    private var cell: BoosterSetCell?
    private let selection: () -> Void
    
    public init(
        viewModel: BoosterSetViewModel,
        delegate: ImageControllerDelegate,
        selection: @escaping () -> Void) {
            self.viewModel = viewModel
            self.delegate = delegate
            self.selection = selection
    }
    
    private func requestImage() {
        delegate.didRequestImage()
    }
    
    private func cancel() {
        delegate.didCancelImageRequest()
        releaseCellForReuse()
    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
}

extension BoosterSetController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.titleLabel.text = viewModel.title
        cell?.numberLabel.text = viewModel.totalCards
        cell?.releaseDateLabel.text = viewModel.releaseDate
        cell?.boosterSetImageView.image = nil
        requestImage()
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.cell = cell as? BoosterSetCell
        requestImage()
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cancel()
    }
}

extension BoosterSetController: UITableViewDataSourcePrefetching {
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        requestImage()
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        cancel()
    }
}

extension BoosterSetController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection()
    }
}


extension BoosterSetController: ResourceView {
    public func display(_ viewModel: UIImage) {
        cell?.boosterSetImageView.setImageAnimated(viewModel)
    }
}

extension BoosterSetController: ResourceLoadingView {
    public func display(_ viewModel: ResourceLoadingViewModel) {
        cell?.containerImageView.isShimmering = viewModel.isLoading
    }
}

extension BoosterSetController: ResourceErrorView{
    public func display(_ viewModel: ResourceErrorViewModel) {
        if viewModel.message != nil {
            cell?.boosterSetImageView.setImageAnimated(UIImage.placeholder(type: Self.self))
        }
    }
}
