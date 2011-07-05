// Hive Mobile
// Copyright (C) 2008 Hive Solutions Lda.
//
// This file is part of Hive Mobile.
//
// Hive Mobile is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Hive Mobile is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Hive Mobile. If not, see <http://www.gnu.org/licenses/>.

// __author__    = Tiago Silva <tsilva@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision: 2390 $
// __date__      = $LastChangedDate: 2009-04-02 08:36:50 +0100 (qui, 02 Abr 2009) $
// __copyright__ = Copyright (c) 2008 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "HMImage.h"

@implementation HMImage

@synthesize imageName = _imageName;
@synthesize leftCap = _leftCap;
@synthesize topCap = _topCap;

+ (HMImage *)imageNamed:(NSString *)imageName {
    // creates the image
    HMImage *image = [[[HMImage alloc] init] autorelease];

    // sets the attributes
    image.imageName = imageName;
    image.topCap = 0;
    image.leftCap = 0;

    // returns the image
    return image;
}

+ (HMImage *)imageNamed:(NSString *)imageName leftCap:(float)leftCap topCap:(float)topCap {
    // creates the image
    HMImage *image = [HMImage imageNamed:imageName];

    // sets the attributes
    image.leftCap = leftCap;
    image.topCap = topCap;

    // returns the image
    return image;
}

- (void)dealloc {
    // releases the image name
    [_imageName release];

    // calls the super
    [super dealloc];
}

@end