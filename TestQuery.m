#import "TestQuery.h"
#import "SlimList.h"
#import "SlimListSerializer.h"

@interface TestQuery ()
@property (nonatomic, strong) NSArray *tableData;
@end

@implementation TestQuery

-(id) initWithString:(NSString*) givenString {
    if ((self = [super init])) {
        self.date = [[self tableDateFormatter] dateFromString:givenString];
    }
    return self;
}

- (NSDateFormatter*)tableDateFormatter {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMM-yyyy"];
    return df;
}

- (void)table:(NSArray*)table {
    self.tableData = table;
}

-(NSArray*) query {
    NSMutableDictionary *lastRow = [NSMutableDictionary dictionaryWithDictionary:[self.tableData lastObject]];
    [lastRow setValue:@"Bradbury" forKey:@"Last Name"];
    [lastRow setValue:[[self tableDateFormatter] stringFromDate:self.date] forKey:@"Hire Date"];
    NSArray *results = @[self.tableData[0],self.tableData[1],lastRow];
    return results;
}

@end
