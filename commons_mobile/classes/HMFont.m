// Hive Mobile
// Copyright (c) 2008-2020 Hive Solutions Lda.
//
// This file is part of Hive Mobile.
//
// Hive Mobile is free software: you can redistribute it and/or modify
// it under the terms of the Apache License as published by the Apache
// Foundation, either version 2.0 of the License, or (at your option) any
// later version.
//
// Hive Mobile is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// Apache License for more details.
//
// You should have received a copy of the Apache License along with
// Hive Mobile. If not, see <http://www.apache.org/licenses/>.

// __author__    = João Magalhães <joamag@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision$
// __date__      = $LastChangedDate$
// __copyright__ = Copyright (c) 2008-2020 Hive Solutions Lda.
// __license__   = Apache License, Version 2.0

#import "HMFont.h"

@implementation HMFont

@synthesize name = _name;
@synthesize size = _size;

- (id)initWithFontName:(NSString *)fontName size:(float)size {
    // calls the super
    self = [super init];

    // sets the attributes
    self.name = fontName;
    self.size = size;

    // returns the self
    return self;
}

- (void)dealloc {
    // releases the name
    [_name release];

    // calls the super
    [super dealloc];
}

- (UIFont *)UIFont {
    // in case the font is defined
    if(_font) {
        // returns the font
        return _font;
    }

    // creates the ui font object
    UIFont *font = [UIFont fontWithName:self.name size:self.size];

    // stores the font for later reference
    _font = font;

    // returns the ui font object
    return font;
}

@end
