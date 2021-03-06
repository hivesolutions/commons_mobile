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

#import "HMStringTableCellItem.h"

@implementation HMStringTableCellItem

@synthesize secure = _secure;
@synthesize returnType = _returnType;
@synthesize autocapitalizationType = _autocapitalizationType;
@synthesize returnDisablesEdit = _returnDisablesEdit;
@synthesize drawColumnSeparator = _drawColumnSeparator;

- (void)dealloc {
    // releases the return type
    [_returnType release];

    // releases the auto capitalization type
    [_autocapitalizationType release];

    // calls the super
    [super dealloc];
}

- (void)initStructures {
    // calls the super
    [super initStructures];

    // sets the default attributes
    self.insertableRow = NO;
    self.deletableRow = NO;
    self.indentable = YES;
    self.clearable = YES;
    self.secure = NO;
    self.returnDisablesEdit = NO;
    self.multipleLines = NO;
    self.autocapitalizationType = @"sentences";
    self.drawColumnSeparator = YES;
}

- (BOOL)multipleLines {
    return _multipleLines;
}

- (void)setMultipleLines:(BOOL)multipleLines {
    // sets the attribute
    _multipleLines = multipleLines;

    // sets the cell's height to adapt to the number of lines
    self.height = multipleLines ? HM_STRING_TABLE_CELL_ITEM_MULTIPLE_LINES_HEIGHT : HM_STRING_TABLE_CELL_ITEM_SINGLE_LINE_HEIGHT;
}

- (void)generateComponent {
    // in case the item has multiple lines
    if(self.multipleLines) {
        // in case the item has a name
        if(self.name) {
            // creates a column multiline string table view cell
            [self generateComponentColumnMultilineStringTableViewCell];
        }
        // in case the item has no name
        else {
            // creates a plain multiline string table view cell
            [self generateComponentPlainMultilineStringTableViewCell];
        }
    } else {
        // in case the item has a name
        if(self.name) {
            // creates a column string table view cell
            [self generateComponentColumnStringTableViewCell];
        }
        // in case the item has no name
        else {
            // creates a plain string table view cell
            [self generateComponentPlainStringTableViewCell];
        }
    }
}

- (void)generateComponentPlainStringTableViewCell {
    // creates the cell identifier
    static NSString *cellIdentifier = @"Cell";

    // creates the component
    HMPlainStringTableViewCell *component = [[HMPlainStringTableViewCell alloc] initWithReuseIdentifier:cellIdentifier];

    // sets the cell's attributes
    component.item = self;
    component.data = self.data;
    component.height = self.height;
    component.secure = self.secure;
    component.name = self.name;
    component.nameLabel.font = self.nameFont.UIFont;
    component.nameLabel.textColor = self.nameColor.UIColor;
    component.nameLabel.numberOfLines = self.nameNumberLines ? self.nameNumberLines.intValue : 1;
    component.nameLabel.textAlignment = [self convertTextAlignment:self.nameAlignment];
    component.nameShadowColor = self.nameShadowColor.UIColor;
    component.namePosition = [self convertPosition:self.namePosition];
    component.nameHorizontalAnchor = [self convertHorizontalAnchor:self.nameHorizontalAnchor];
    component.nameVerticalAnchor = [self convertVerticalAnchor:self.nameVerticalAnchor];
    component.nameWidth = self.nameWidth;
    component.description = self.description;
    component.descriptionLabel.font = self.descriptionFont.UIFont;
    component.descriptionLabel.textColor = self.descriptionColor.UIColor;
    component.descriptionLabel.numberOfLines = self.descriptionNumberLines ? self.descriptionNumberLines.intValue : 1;
    component.descriptionLabel.textAlignment = [self convertTextAlignment:self.descriptionAlignment];
    component.descriptionShadowColor = self.descriptionShadowColor.UIColor;
    component.descriptionPosition = [self convertPosition:self.descriptionPosition];
    component.descriptionHorizontalAnchor = [self convertHorizontalAnchor:self.descriptionHorizontalAnchor];
    component.descriptionVerticalAnchor = [self convertVerticalAnchor:self.descriptionVerticalAnchor];
    component.descriptionWidth = self.descriptionWidth;
    component.subDescription = self.subDescription;
    component.subDescriptionFont = self.subDescriptionFont.UIFont;
    component.subDescriptionLabel.textColor = self.subDescriptionColor.UIColor;
    component.subDescriptionLabel.numberOfLines = self.subDescriptionNumberLines ? self.subDescriptionNumberLines.intValue : 1;
    component.subDescriptionLabel.textAlignment = [self convertTextAlignment:self.subDescriptionAlignment];
    component.subDescriptionShadowColor = self.subDescriptionShadowColor.UIColor;
    component.subDescriptionPosition = [self convertPosition:self.subDescriptionPosition];
    component.subDescriptionHorizontalAnchor = [self convertHorizontalAnchor:self.subDescriptionHorizontalAnchor];
    component.subDescriptionVerticalAnchor = [self convertVerticalAnchor:self.subDescriptionVerticalAnchor];
    component.subDescriptionWidth = self.subDescriptionWidth;
    component.cornerRadius = self.cornerRadius;
    component.borderColor = self.borderColor.UIColor;
    component.backgroundColor = self.backgroundColor.UIColor;
    component.backgroundColors = [self convertColors:self.backgroundColors];
    component.backgroundTopSeparatorColor = self.topSeparatorColor.UIColor;
    component.backgroundBottomSeparatorColor = self.bottomSeparatorColor.UIColor;
    component.backgroundTopSeparatorStyle = [self convertSeparatorStyle:self.topSeparatorStyle];
    component.backgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.bottomSeparatorStyle];
    component.selectedBackgroundColors = [self convertColors:self.selectedBackgroundColors];
    component.selectedBackgroundTopSeparatorColor = self.selectedTopSeparatorColor.UIColor;
    component.selectedBackgroundBottomSeparatorColor = self.selectedBottomSeparatorColor.UIColor;
    component.selectedBackgroundTopSeparatorStyle = [self convertSeparatorStyle:self.selectedTopSeparatorStyle];
    component.selectedBackgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.selectedBottomSeparatorStyle];
    component.imageView.image = self.iconNormal.UIImage;
    component.imageView.highlightedImage = self.iconHighlighted.UIImage;
    component.selectable = self.selectable;
    component.selectableName = self.selectableName;
    component.insertableRow = self.insertableRow;
    component.deletableRow = self.deletableRow;
    component.selectableEdit = self.selectableEdit;
    component.defaultValue = self.defaultValue;
    component.clearable = self.clearable;
    component.returnType = self.returnType;
    component.autocapitalizationType = self.autocapitalizationType;
    component.returnDisablesEdit = self.returnDisablesEdit;
    component.focusEdit = self.focusEdit;
    component.readViewController = self.readViewController;
    component.readNibName = self.readNibName;
    component.editViewController = self.editViewController;
    component.editNibName = self.editNibName;

    // in case the accessory is defined
    if(self.accessory) {
        // sets the accessory view in the component
        component.accessoryView = self.accessory.component;
        component.editingAccessoryView = self.accessory.component;
    }

    // for each sub item
    for(HMItem *subItem in self.subItems) {
        // adds the component as a subview
        [component.contentView addSubview:subItem.component];
    }

    // sets the objects
    self.component = component;

    // releases the objects
    [component release];
}

- (void)generateComponentColumnStringTableViewCell {
    // creates the cell identifier
    static NSString *cellIdentifier = @"Cell";

    // creates the component
    HMColumnStringTableViewCell *component = [[HMColumnStringTableViewCell alloc] initWithReuseIdentifier:cellIdentifier];

    // sets the cell's attributes
    component.item = self;
    component.data = self.data;
    component.height = self.height;
    component.secure = self.secure;
    component.name = self.name;
    component.nameLabel.font = self.nameFont.UIFont;
    component.nameLabel.textColor = self.nameColor.UIColor;
    component.nameLabel.numberOfLines = self.nameNumberLines ? self.nameNumberLines.intValue : 1;
    component.nameLabel.textAlignment = [self convertTextAlignment:self.nameAlignment];
    component.nameShadowColor = self.nameShadowColor.UIColor;
    component.namePosition = [self convertPosition:self.namePosition];
    component.nameHorizontalAnchor = [self convertHorizontalAnchor:self.nameHorizontalAnchor];
    component.nameVerticalAnchor = [self convertVerticalAnchor:self.nameVerticalAnchor];
    component.nameWidth = self.nameWidth;
    component.description = self.description;
    component.descriptionLabel.font = self.descriptionFont.UIFont;
    component.descriptionLabel.textColor = self.descriptionColor.UIColor;
    component.descriptionLabel.numberOfLines = self.descriptionNumberLines ? self.descriptionNumberLines.intValue : 1;
    component.descriptionLabel.textAlignment = [self convertTextAlignment:self.descriptionAlignment];
    component.descriptionShadowColor = self.descriptionShadowColor.UIColor;
    component.descriptionPosition = [self convertPosition:self.descriptionPosition];
    component.descriptionHorizontalAnchor = [self convertHorizontalAnchor:self.descriptionHorizontalAnchor];
    component.descriptionVerticalAnchor = [self convertVerticalAnchor:self.descriptionVerticalAnchor];
    component.descriptionWidth = self.descriptionWidth;
    component.subDescription = self.subDescription;
    component.subDescriptionFont = self.subDescriptionFont.UIFont;
    component.subDescriptionLabel.textColor = self.subDescriptionColor.UIColor;
    component.subDescriptionLabel.numberOfLines = self.subDescriptionNumberLines ? self.subDescriptionNumberLines.intValue : 1;
    component.subDescriptionLabel.textAlignment = [self convertTextAlignment:self.subDescriptionAlignment];
    component.subDescriptionShadowColor = self.subDescriptionShadowColor.UIColor;
    component.subDescriptionPosition = [self convertPosition:self.subDescriptionPosition];
    component.subDescriptionHorizontalAnchor = [self convertHorizontalAnchor:self.subDescriptionHorizontalAnchor];
    component.subDescriptionVerticalAnchor = [self convertVerticalAnchor:self.subDescriptionVerticalAnchor];
    component.subDescriptionWidth = self.subDescriptionWidth;
    component.cornerRadius = self.cornerRadius;
    component.borderColor = self.borderColor.UIColor;
    component.backgroundColor = self.backgroundColor.UIColor;
    component.backgroundColors = [self convertColors:self.backgroundColors];
    component.backgroundTopSeparatorColor = self.topSeparatorColor.UIColor;
    component.backgroundBottomSeparatorColor = self.bottomSeparatorColor.UIColor;
    component.backgroundTopSeparatorStyle = [self convertSeparatorStyle:self.topSeparatorStyle];
    component.backgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.bottomSeparatorStyle];
    component.selectedBackgroundColors = [self convertColors:self.selectedBackgroundColors];
    component.selectedBackgroundTopSeparatorColor = self.selectedTopSeparatorColor.UIColor;
    component.selectedBackgroundBottomSeparatorColor = self.selectedBottomSeparatorColor.UIColor;
    component.selectedBackgroundTopSeparatorStyle = [self convertSeparatorStyle:self.selectedTopSeparatorStyle];
    component.selectedBackgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.selectedBottomSeparatorStyle];
    component.imageView.image = self.iconNormal.UIImage;
    component.imageView.highlightedImage = self.iconHighlighted.UIImage;
    component.selectable = self.selectable;
    component.selectableName = self.selectableName;
    component.insertableRow = self.insertableRow;
    component.deletableRow = self.deletableRow;
    component.selectableEdit = self.selectableEdit;
    component.defaultValue = self.defaultValue;
    component.clearable = self.clearable;
    component.returnType = self.returnType;
    component.autocapitalizationType = self.autocapitalizationType;
    component.returnDisablesEdit = self.returnDisablesEdit;
    component.focusEdit = self.focusEdit;
    component.readViewController = self.readViewController;
    component.readNibName = self.readNibName;
    component.editViewController = self.editViewController;
    component.editNibName = self.editNibName;
    component.drawColumnSeparator = self.drawColumnSeparator;

    // in case the accessory is defined
    if(self.accessory) {
        // sets the accessory view in the component
        component.accessoryView = self.accessory.component;
        component.editingAccessoryView = self.accessory.component;
    }

    // for each sub item
    for(HMItem *subItem in self.subItems) {
        // adds the component as a subview
        [component.contentView addSubview:subItem.component];
    }

    // sets the objects
    self.component = component;

    // releases the objects
    [component release];
}

- (void)generateComponentPlainMultilineStringTableViewCell {
    // creates the cell identifier
    static NSString *cellIdentifier = @"Cell";

    // creates the component
    HMPlainMultilineStringTableViewCell *component = [[HMPlainMultilineStringTableViewCell alloc] initWithReuseIdentifier:cellIdentifier];

    // sets the cell's attributes
    component.item = self;
    component.data = self.data;
    component.height = self.height;
    component.secure = self.secure;
    component.name = self.name;
    component.nameLabel.font = self.nameFont.UIFont;
    component.nameLabel.textColor = self.nameColor.UIColor;
    component.nameLabel.numberOfLines = self.nameNumberLines ? self.nameNumberLines.intValue : 1;
    component.nameLabel.textAlignment = [self convertTextAlignment:self.nameAlignment];
    component.nameShadowColor = self.nameShadowColor.UIColor;
    component.namePosition = [self convertPosition:self.namePosition];
    component.nameHorizontalAnchor = [self convertHorizontalAnchor:self.nameHorizontalAnchor];
    component.nameVerticalAnchor = [self convertVerticalAnchor:self.nameVerticalAnchor];
    component.nameWidth = self.nameWidth;
    component.description = self.description;
    component.descriptionLabel.font = self.descriptionFont.UIFont;
    component.descriptionLabel.textColor = self.descriptionColor.UIColor;
    component.descriptionLabel.numberOfLines = self.descriptionNumberLines ? self.descriptionNumberLines.intValue : 1;
    component.descriptionLabel.textAlignment = [self convertTextAlignment:self.descriptionAlignment];
    component.descriptionShadowColor = self.descriptionShadowColor.UIColor;
    component.descriptionPosition = [self convertPosition:self.descriptionPosition];
    component.descriptionHorizontalAnchor = [self convertHorizontalAnchor:self.descriptionHorizontalAnchor];
    component.descriptionVerticalAnchor = [self convertVerticalAnchor:self.descriptionVerticalAnchor];
    component.descriptionWidth = self.descriptionWidth;
    component.subDescription = self.subDescription;
    component.subDescriptionFont = self.subDescriptionFont.UIFont;
    component.subDescriptionLabel.textColor = self.subDescriptionColor.UIColor;
    component.subDescriptionLabel.numberOfLines = self.subDescriptionNumberLines ? self.subDescriptionNumberLines.intValue : 1;
    component.subDescriptionLabel.textAlignment = [self convertTextAlignment:self.subDescriptionAlignment];
    component.subDescriptionShadowColor = self.subDescriptionShadowColor.UIColor;
    component.subDescriptionPosition = [self convertPosition:self.subDescriptionPosition];
    component.subDescriptionHorizontalAnchor = [self convertHorizontalAnchor:self.subDescriptionHorizontalAnchor];
    component.subDescriptionVerticalAnchor = [self convertVerticalAnchor:self.subDescriptionVerticalAnchor];
    component.subDescriptionWidth = self.subDescriptionWidth;
    component.cornerRadius = self.cornerRadius;
    component.borderColor = self.borderColor.UIColor;
    component.backgroundColor = self.backgroundColor.UIColor;
    component.backgroundColors = [self convertColors:self.backgroundColors];
    component.backgroundTopSeparatorColor = self.topSeparatorColor.UIColor;
    component.backgroundBottomSeparatorColor = self.bottomSeparatorColor.UIColor;
    component.backgroundTopSeparatorStyle = [self convertSeparatorStyle:self.topSeparatorStyle];
    component.backgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.bottomSeparatorStyle];
    component.selectedBackgroundColors = [self convertColors:self.selectedBackgroundColors];
    component.selectedBackgroundTopSeparatorColor = self.selectedTopSeparatorColor.UIColor;
    component.selectedBackgroundBottomSeparatorColor = self.selectedBottomSeparatorColor.UIColor;
    component.selectedBackgroundTopSeparatorStyle = [self convertSeparatorStyle:self.selectedTopSeparatorStyle];
    component.selectedBackgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.selectedBottomSeparatorStyle];
    component.imageView.image = self.iconNormal.UIImage;
    component.imageView.highlightedImage = self.iconHighlighted.UIImage;
    component.selectable = self.selectable;
    component.selectableName = self.selectableName;
    component.insertableRow = self.insertableRow;
    component.deletableRow = self.deletableRow;
    component.selectableEdit = self.selectableEdit;
    component.defaultValue = self.defaultValue;
    component.clearable = self.clearable;
    component.returnType = self.returnType;
    component.autocapitalizationType = self.autocapitalizationType;
    component.returnDisablesEdit = self.returnDisablesEdit;
    component.focusEdit = self.focusEdit;
    component.readViewController = self.readViewController;
    component.readNibName = self.readNibName;
    component.editViewController = self.editViewController;
    component.editNibName = self.editNibName;

    // in case the accessory is defined
    if(self.accessory) {
        // sets the accessory view in the component
        component.accessoryView = self.accessory.component;
        component.editingAccessoryView = self.accessory.component;
    }

    // for each sub item
    for(HMItem *subItem in self.subItems) {
        // adds the component as a subview
        [component.contentView addSubview:subItem.component];
    }

    // sets the objects
    self.component = component;

    // releases the objects
    [component release];
}

- (void)generateComponentColumnMultilineStringTableViewCell {
    // creates the cell identifier
    static NSString *cellIdentifier = @"Cell";

    // creates the component
    HMColumnMultilineStringTableViewCell *component = [[HMColumnMultilineStringTableViewCell alloc] initWithReuseIdentifier:cellIdentifier];

    // sets the cell's attributes
    component.item = self;
    component.data = self.data;
    component.height = self.height;
    component.secure = self.secure;
    component.name = self.name;
    component.nameLabel.font = self.nameFont.UIFont;
    component.nameLabel.textColor = self.nameColor.UIColor;
    component.nameLabel.numberOfLines = self.nameNumberLines ? self.nameNumberLines.intValue : 1;
    component.nameLabel.textAlignment = [self convertTextAlignment:self.nameAlignment];
    component.nameShadowColor = self.nameShadowColor.UIColor;
    component.namePosition = [self convertPosition:self.namePosition];
    component.nameHorizontalAnchor = [self convertHorizontalAnchor:self.nameHorizontalAnchor];
    component.nameVerticalAnchor = [self convertVerticalAnchor:self.nameVerticalAnchor];
    component.nameWidth = self.nameWidth;
    component.description = self.description;
    component.descriptionLabel.font = self.descriptionFont.UIFont;
    component.descriptionLabel.textColor = self.descriptionColor.UIColor;
    component.descriptionLabel.numberOfLines = self.descriptionNumberLines ? self.descriptionNumberLines.intValue : 1;
    component.descriptionLabel.textAlignment = [self convertTextAlignment:self.descriptionAlignment];
    component.descriptionShadowColor = self.descriptionShadowColor.UIColor;
    component.descriptionPosition = [self convertPosition:self.descriptionPosition];
    component.descriptionHorizontalAnchor = [self convertHorizontalAnchor:self.descriptionHorizontalAnchor];
    component.descriptionVerticalAnchor = [self convertVerticalAnchor:self.descriptionVerticalAnchor];
    component.descriptionWidth = self.descriptionWidth;
    component.subDescription = self.subDescription;
    component.subDescriptionFont = self.subDescriptionFont.UIFont;
    component.subDescriptionLabel.textColor = self.subDescriptionColor.UIColor;
    component.subDescriptionLabel.numberOfLines = self.subDescriptionNumberLines ? self.subDescriptionNumberLines.intValue : 1;
    component.subDescriptionLabel.textAlignment = [self convertTextAlignment:self.subDescriptionAlignment];
    component.subDescriptionShadowColor = self.subDescriptionShadowColor.UIColor;
    component.subDescriptionPosition = [self convertPosition:self.subDescriptionPosition];
    component.subDescriptionHorizontalAnchor = [self convertHorizontalAnchor:self.subDescriptionHorizontalAnchor];
    component.subDescriptionVerticalAnchor = [self convertVerticalAnchor:self.subDescriptionVerticalAnchor];
    component.subDescriptionWidth = self.subDescriptionWidth;
    component.cornerRadius = self.cornerRadius;
    component.borderColor = self.borderColor.UIColor;
    component.backgroundColor = self.backgroundColor.UIColor;
    component.backgroundColors = [self convertColors:self.backgroundColors];
    component.backgroundTopSeparatorColor = self.topSeparatorColor.UIColor;
    component.backgroundBottomSeparatorColor = self.bottomSeparatorColor.UIColor;
    component.backgroundTopSeparatorStyle = [self convertSeparatorStyle:self.topSeparatorStyle];
    component.backgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.bottomSeparatorStyle];
    component.selectedBackgroundColors = [self convertColors:self.selectedBackgroundColors];
    component.selectedBackgroundTopSeparatorColor = self.selectedTopSeparatorColor.UIColor;
    component.selectedBackgroundBottomSeparatorColor = self.selectedBottomSeparatorColor.UIColor;
    component.selectedBackgroundTopSeparatorStyle = [self convertSeparatorStyle:self.selectedTopSeparatorStyle];
    component.selectedBackgroundBottomSeparatorStyle = [self convertSeparatorStyle:self.selectedBottomSeparatorStyle];
    component.imageView.image = self.iconNormal.UIImage;
    component.imageView.highlightedImage = self.iconHighlighted.UIImage;
    component.selectable = self.selectable;
    component.selectableName = self.selectableName;
    component.insertableRow = self.insertableRow;
    component.deletableRow = self.deletableRow;
    component.selectableEdit = self.selectableEdit;
    component.defaultValue = self.defaultValue;
    component.clearable = self.clearable;
    component.returnType = self.returnType;
    component.autocapitalizationType = self.autocapitalizationType;
    component.returnDisablesEdit = self.returnDisablesEdit;
    component.focusEdit = self.focusEdit;
    component.readViewController = self.readViewController;
    component.readNibName = self.readNibName;
    component.editViewController = self.editViewController;
    component.editNibName = self.editNibName;

    // in case the accessory is defined
    if(self.accessory) {
        // sets the accessory view in the component
        component.accessoryView = self.accessory.component;
        component.editingAccessoryView = self.accessory.component;
    }

    // for each sub item
    for(HMItem *subItem in self.subItems) {
        // adds the component as a subview
        [component.contentView addSubview:subItem.component];
    }

    // sets the objects
    self.component = component;

    // releases the objects
    [component release];
}

@end
