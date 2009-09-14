//
//  QSOperaSource.m
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

#import "QSOperaSource.h"
#import "OperaBookmark.h"
#import "QSOpera.h"
#import <QSCore/QSObject.h>


@implementation QSOperaSource

- (BOOL)indexIsValidFromDate:(NSDate *)indexDate forEntry:(NSDictionary *)theEntry{
	return ([indexDate compare:[OperaBookmark getLastChangeDate]] != NSOrderedAscending);
}

- (NSImage *) iconForEntry:(NSDictionary *)dict{
    return [OperaBookmark getOperaIcon];
}


- (NSArray *) objectsForEntry:(NSDictionary *)theEntry{
	NSArray *oSearchItems = [OperaBookmark loadSearches];
	NSArray *oBookmarkItems = [OperaBookmark loadBookmarks];
	int iCount = (oSearchItems != nil ? [oSearchItems count] : 0) + (oBookmarkItems != nil ? [oBookmarkItems count] : 0);
    NSMutableArray *objects=[NSMutableArray arrayWithCapacity:iCount];
	if (oBookmarkItems != nil)
		[QSOpera mapObjectsFrom:oBookmarkItems into:objects];
	if (oSearchItems != nil)
		[QSOpera mapObjectsFrom:oSearchItems into:objects];
    return objects;
}

- (id)resolveProxyObject:(id)proxy {
	if ([[proxy identifier] isEqualToString:@"QSOperaCurrentWebPageProxy"]) {
		NSString *sURL = nil;
		NSString *sTitle = nil;
		if (![OperaBookmark getCurrentOperaURL:&sURL andTitle:&sTitle])
			return nil;
		return [QSObject URLObjectWithURL:sURL title:sTitle];
	}
	return nil;
}

@end
