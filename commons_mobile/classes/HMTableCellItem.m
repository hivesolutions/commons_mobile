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

#import "HMTableCellItem.h"

@implementation HMTableCellItem

@synthesize accessoryType = _accessoryType;
@synthesize accessoryValue = _accessoryValue;
@synthesize indentable = _indentable;
@synthesize clearable = _clearable;

- (id)init {
    // invokes the parent constructor
    self = [super init];

    // sets the default attributes
    self.indentable = NO;
    self.clearable = NO;
    self.editable = NO;

    // returns the instance
    return self;
}

- (id)initWithIdentifier:(NSString *)identifier {
    // invokes the parent constructor
    self = [super initWithIdentifier:identifier];

    // sets the default attributes
    self.indentable = NO;
    self.clearable = NO;
    self.editable = NO;

    // returns the instance
    return self;
}

- (void)dealloc {
    // releases the acessory type
    [_accessoryType release];

    // calls the super
    [super dealloc];
}

- (BOOL)editable {
    return _editable;
}

- (void)setEditable:(BOOL)editable {
    // sets the editable attribute
    _editable = editable;

    // changes the indentable
    // and clearable attributes
    // to be coherent with the
    // editable property
    _indentable = editable;
    _clearable = editable;
}

@end
