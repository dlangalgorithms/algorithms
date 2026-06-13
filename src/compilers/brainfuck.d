import std.stdio;
import std.conv : to;

string brainfuck(string content) {
    string result = "#include <stdio.h>\nint main(){unsigned char tape[30000] = { 0 };unsigned char* ptr = tape;\n";

    int i = 0;
    while (i < content.length) {
        char ch = content[i];
        int sameCh = 1;

        while (i + sameCh < content.length && content[i + sameCh] == ch) {
            sameCh++;
        }

        final switch (ch) {
            case '>': result ~= "ptr+=" ~ sameCh.to!string ~ ";\n"; break;
            case '<': result ~= "ptr-=" ~ sameCh.to!string ~ ";\n"; break;
            case '+': result ~= "*ptr+=" ~ sameCh.to!string ~ ";\n"; break;
            case '-': result ~= "*ptr-=" ~ sameCh.to!string ~ ";\n"; break;
            case '.': result ~= "putchar(*ptr);\n"; break;
            case ',': result ~= "*ptr=getchar();\n"; break;
            case '[': result ~= "while(*ptr){\n"; break;
            case ']': result ~= "}\n"; break;
        }

        i += sameCh;
    }

    result ~= "}\n";
    return result;
}

unittest {
    assert(brainfuck("++>-.") == "#include <stdio.h>\nint main(){unsigned char tape[30000] = { 0 };unsigned char* ptr = tape;\n*ptr+=2;\nptr+=1;\n*ptr-=1;\nputchar(*ptr);\n}\n");
}

void main() {}
