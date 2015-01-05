// Hive Mobile
// Copyright (C) 2008-2015 Hive Solutions Lda.
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
// __revision__  = $LastChangedRevision$
// __date__      = $LastChangedDate$
// __copyright__ = Copyright (c) 2008-2015 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "Dependencies.h"

#import "HMItemGroup.h"
#import "HMLabelItem.h"

/**
 * Represents a table section.
 */
@interface HMTableSectionItemGroup : HMItemGroup {
    @private
    NSString *_headerString;
    NSString *_footerString;
    HMLabelItem *_header;
    HMLabelItem *_footer;
}

/**
 * The string representation of the header.
 */
@property (retain) NSString *headerString;

/**
 * The footer representation of the footer.
 */
@property (retain) NSString *footerString;

/**
 * The header for the table section.
 */
@property (retain) HMLabelItem *header;

/**
 * The footer for the table section.
 */
@property (retain) HMLabelItem *footer;

@end
