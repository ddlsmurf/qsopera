//
//  QSOperaBundleSource.m
//  QSOpera
//
/* (c) Copyright 2009 Eric Doughty-Papassideris. All Rights Reserved.

	This file is part of QSOpera.

    QSOpera is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    QSOpera is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with QSOpera.  If not, see <http://www.gnu.org/licenses/>.
*/

#import "QSOperaBundleSource.h"
#import "OperaBookmark.h"
#import "QSOpera.h"
#import <QSCore/QSObject.h>


@implementation QSOperaBundleSource

- (BOOL)indexIsValidFromDate:(NSDate *)indexDate forEntry:(NSDictionary *)theEntry{
	return NO;
}

- (NSImage *) iconForEntry:(NSDictionary *)dict{
    return [OperaBookmark getOperaIcon];
}

- (NSArray *) getTabs{
	NSArray *oTabs = [OperaBookmark getCurrentOperaTabs];
	if (oTabs != nil)
	{
		NSMutableArray *oCurQSTabs=[NSMutableArray arrayWithCapacity:[oTabs count]];
		[QSOpera mapObjectsFrom:oTabs into:oCurQSTabs];
		return oCurQSTabs;
	}
	return nil;
}

- (BOOL)loadChildrenForObject:(QSObject *)object {
	if (object == nil || ![[object identifier] isEqualToString:[[NSWorkspace sharedWorkspace] absolutePathForAppBundleWithIdentifier:@"com.operasoftware.Opera"]])
		return NO;
	NSArray *children = [self getTabs];
	if (children) {
		[object setChildren:children];
		return YES;
	} else
		return NO;
}

@end
