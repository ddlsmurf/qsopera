//
//  QSOpera.m
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

#import "QSOpera.h"
#import "QSOperaSource.h"
#import "OperaBookmark.h"
#import <QSCore/QSObject.h>
#import <QSCore/QSObject_URLHandling.h>

@implementation QSOpera

+ (QSObject*) QSObjectForURL:(NSString *)url andTitle:(NSString *)title andIcon:(NSString *)icon andDescription:(NSString *)descr {
	QSObject *oNewObject = [QSObject URLObjectWithURL:url title:title];
	if (oNewObject) {
		if (descr != nil) [oNewObject setLabel:descr];
		[oNewObject setDetails:url];
		if (icon) [oNewObject setObject:icon forMeta:kQSObjectIconName];
	}
	return oNewObject;
}

+ (void) mapObjectsFrom:(NSArray *)opera into:(NSMutableArray *)quicksilver
{
	int iCount = [opera count];
	int i;
	for (i = 0; i < iCount; i++)
	{
		OperaBookmark *oItem = (OperaBookmark *)[opera objectAtIndex:i];
		QSObject *oNewObject = [QSOpera QSObjectForURL:[oItem URL] andTitle:[oItem keywordPrefixedTitle] andIcon:[oItem icon] andDescription:[oItem description]];
		if (oNewObject != nil)
			[quicksilver addObject:oNewObject];
	}
}

@end
