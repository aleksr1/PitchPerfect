//
//  RecordAudio.swift
//  PitchPerfect
//
//  Created by Justin Owens on 11/10/15.
//  Copyright © 2015 Justin Owens. All rights reserved.
//

import Foundation
class RecordedAudio{
    var filePathUrl: NSURL!
    var title: String!
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}