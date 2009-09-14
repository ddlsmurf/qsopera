//
//  QSOperaAction.m
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

#import "QSOperaAction.h"

@implementation QSOperaAction

- (QSObject *)performActionOnObject:(QSObject *)dObject{
	[[NSWorkspace sharedWorkspace] openURLs:[NSArray arrayWithObject:[NSURL URLWithString:[dObject stringValue]]] withAppBundleIdentifier:@"com.operasoftware.Opera" options:0 additionalEventParamDescriptor:nil launchIdentifiers:nil];
	
	return nil;
}
@end
