//
//  OperaBookmark.h
//  OperaParser
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

#import <Cocoa/Cocoa.h>


@interface OperaBookmark : NSObject {
	NSString *_sTitle;
	NSString *_sIcon;
	NSString *_sURL;
	NSString *_sDescription;
	NSString *_sKeywords;
}

+(NSArray*)loadBookmarks;
+(NSArray*)loadSearches;
+(NSImage *)getOperaIcon;
+(NSDate *)getLastChangeDate;
+(BOOL)getCurrentOperaURL:(NSString **)url andTitle:(NSString **)title;
+(NSArray *)getCurrentOperaTabs;
-(NSImage *)loadIcon;
-(NSString *)keywordPrefixedTitle;

@property (copy) NSString *title;
@property (copy) NSString *icon;
@property (copy) NSString *URL;
@property (copy) NSString *description;
@property (copy) NSString *keywords;

@end
