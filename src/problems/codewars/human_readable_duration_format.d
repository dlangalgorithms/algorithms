import std;
import std.conv;

/*
 * Link: https://www.codewars.com/kata/52742f58faf5485cae000b9a
 * 
 * Human readable duration format
 * Difficulty: 4 kyu
 *
 * Problem:
 * Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.
 * 
 * The function must accept a non-negative integer. If it is zero, it just returns `"now"`.
 * Otherwise, the duration is expressed as a combination of `years`, `days`, `hours`, `minutes` and `seconds`.
 * 
 * It is much easier to understand with an example:
 * 
 * For seconds = 62, your function should return 
 *     "1 minute and 2 seconds"
 * For seconds = 3662, your function should return
 *     "1 hour, 1 minute and 2 seconds"
 * 
 * For the purpose of this Kata, a year is 365 days and a day is 24 hours.
 * 
 * Note that spaces are important.
 * 
 * Detailed rules
 * 
 * The resulting expression is made of components like `4 seconds`, `1 year`, etc.
 * In general, a positive integer and one of the valid units of time, separated by a space.
 * The unit of time is used in plural if the integer is greater than 1.
 * 
 * The components are separated by a comma and a space (`", "`).
 * Except the last component, which is separated by `" and "`, just like it would be written in English.
 * 
 * A more significant units of time will occur before than a least significant one.
 * Therefore, `1 second and 1 year` is not correct, but `1 year and 1 second` is.
 * 
 * Different components have different unit of times.
 * So there is not repeated units like in `5 seconds and 1 second`.
 * 
 * A component will not appear at all if its value happens to be zero.
 * Hence, `1 minute and 0 seconds` is not valid, but it should be just `1 minute`.
 * 
 * A unit of time must be used "as much as possible".
 * It means that the function should not return `61 seconds`, but `1 minute and 1 second` instead.
 * Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.
 * 
 * Tags: Strings, Date Time, Algorithms
 * 
*/

enum TimeUnit {
    Years,
    Days,
    Hours,
    Minutes,
    Seconds
}

struct Time {
    TimeUnit unit;
    uint amount;
    
    /*
     * Converts struct for example to "3 seconds"
    */
    string toString() const {
        return amount.to!string ~ ' ' ~ getUnitName(this);
    }
}

/*
 * Gives name of unit in plural or singular form depend 
*/
string getUnitName(Time unit) {
    switch (unit.unit) {
        case TimeUnit.Years:
            return (unit.amount > 1) ? "years" : "year";
        case TimeUnit.Days:
            return (unit.amount > 1) ? "days" : "day";
        case TimeUnit.Hours:
            return (unit.amount > 1) ? "hours" : "hour";
        case TimeUnit.Minutes:
            return (unit.amount > 1) ? "minutes" : "minute";
        case TimeUnit.Seconds:
            return (unit.amount > 1) ? "seconds" : "second";
        default:
            return "Why do you read this? :^)";
    }
}

/*
 * Converts seconds to list of units
*/
Time[] calculate(uint seconds) {
    Time[] time = [];
    
    uint a = seconds / (365*24*60*60);
    if (a != 0) {
        time ~= Time(TimeUnit.Years, a);
        seconds %= 365*24*60*60;
    }
    a = seconds / (24*60*60);
    if (a != 0) {
        time ~= Time(TimeUnit.Days, a);
        seconds %= 24*60*60;
    }
    a = seconds / (60*60);
    if (a != 0) {
        time ~= Time(TimeUnit.Hours, a);
        seconds %= 60*60;
    }
    a = seconds / 60;
    if (a != 0) {
        time ~= Time(TimeUnit.Minutes, a);
        seconds %= 60;
    }
    if (seconds != 0) {
        time ~= Time(TimeUnit.Seconds, seconds);
    }
    return time;
    
}

string formatDuration(uint seconds) {
    if (seconds == 0) return "now";
    
    Time[] time = calculate(seconds);

    if (time.length == 1) {
        return time[0].to!string;
    }
    
    string result;
    for (int i = 0; i < time.length; i++) {
        result ~= time[i].to!string;
        if (i == time.length - 1) break;
        if (i == time.length - 2) result ~= " and ";
        else result ~= ", ";
    }
    return result;
}

unittest {
    assert(formatDuration(0) == "now");
    assert(formatDuration(1) == "1 second");
    assert(formatDuration(62) == "1 minute and 2 seconds");
    assert(formatDuration(120) == "2 minutes");
    assert(formatDuration(3600) == "1 hour");
    assert(formatDuration(3662) == "1 hour, 1 minute and 2 seconds");
}

void main() {}