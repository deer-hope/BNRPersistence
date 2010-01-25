// The MIT License
//
// Copyright (c) 2008 Big Nerd Ranch, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "Song.h"
#import "BNRDataBuffer.h"

@implementation Song

@synthesize title, seconds;

- (NSString *)title
{
    if (![self hasContent]) {
        [self fetchContent];
    }
    return title;
}

- (unsigned int)seconds
{
    if (![self hasContent]) {
        [self fetchContent];
    }
    return seconds;
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}

- (void)readContentFromBuffer:(BNRDataBuffer *)d
{
    [self setTitle:[d readString]];
    [self setSeconds:[d readUInt32]];
}
- (void)writeContentToBuffer:(BNRDataBuffer *)d
{
    [d writeString:title];
    [d writeUInt32:seconds];
}

@end