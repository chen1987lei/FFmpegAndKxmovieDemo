//
//  FFHomeCell.swift
//  FFmpegAndKxmovieDemo
//
//  Created by 马超 on 16/4/13.
//  Copyright © 2016年 qq 714080794. All rights reserved.
//

protocol FFHomeCellDelegate {
    
    /// 点击了播放
    func cellDidClickPlay(cell :FFHomeCell)
}

class FFHomeCell: BasicTableViewCell {

    var viewModel: VideoLayout?
    
    var indexPath: NSIndexPath!
    
    var delegate: FFHomeCellDelegate?
    
    var videoContentView: FFHomeVideoStyleView!   ///  视频播放的总容器
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.videoContentView = FFHomeVideoStyleView()
        self.videoContentView.cell = self
        self.contentView.addSubview(self.videoContentView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWithViewModel(viewModel: VideoLayout) {
        
        self.viewModel = viewModel
        
       let layout = viewModel
        
        self.height = layout.height
        self.contentView.height = layout.height
        
        self.videoContentView.bindLayout(layout)
    }
    
    func clear() {
        
        self.videoContentView.clear()
        
    }
    
    func reset() {
        
        self.videoContentView.reset()
    }
}


extension FFHomeCell: Updataable {
    
    typealias ViewModel = VideoLayout
}