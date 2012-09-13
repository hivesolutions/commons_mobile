// Hive Mobile
// Copyright (C) 2008-2012 Hive Solutions Lda.
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
// __date__      = $LastChangedDate: 2009-04-02 08:36:50 +0100 (qui, 02 Abr 2009) $
// __copyright__ = Copyright (c) 2008-2012 Hive Solutions Lda.
// __license__   = GNU General Public License (GPL), Version 3

#import "Dependencies.h"

#import "HMFont.h"
#import "HMItem.h"
#import "HMColor.h"
#import "HMTableCellItem.h"
#import "HMTableSectionItemGroup.h"
#import "HMConstantStringTableCellItem.h"
#import "HMTableCellItemCreationDelegate.h"

/**
 * Represents a table section whose
 * item number can change.
 */
@interface HMTableMutableSectionItemGroup : HMTableSectionItemGroup {
    @private
    Class _addViewController;
    NSString *_addNibName;
    HMTableCellItem *_addTableCellItem;
    NSObject<HMTableCellItemCreationDelegate> *_tableCellItemCreationDelegate;
}

/**
 * The view controller to use
 * for adding a new item.
 */
@property (assign) Class addViewController;

/**
 * The name of the nib for the view
 * controller that will be used
 * for adding an item.
 */
@property (retain) NSString *addNibName;

/**
 * The add table cell item.
 */
@property (retain) HMTableCellItem *addTableCellItem;

/**
 * The table cell item creation delegate.
 */
@property (retain) NSObject<HMTableCellItemCreationDelegate> *tableCellItemCreationDelegate;

/**
 * Returns a list with all items
 * that represent data.
 *
 * @return List with the data items.
 */
- (NSMutableArray *)dataItems;

@end
