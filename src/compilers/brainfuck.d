import std.stdio;
import std.file;
import std.string;

void main(string[] args) {
    if (args.length < 2) {
        writeln("Usage: ", args[0], " filename");
        return;
    }

    auto inputFile = args[1];
    auto outputFile = inputFile[0 .. inputFile.length - inputFile.lastIndexOf('.')].dup ~ ".txt";

    try {
        auto content = readText(inputFile);
        auto writer = File(outputFile, "w");

        writer.write("#include <stdio.h>\nint main(){unsigned char tape[30000] = { 0 };unsigned char* ptr = tape;\n");

        int i = 0;
        while (i < content.length) {
            char ch = content[i];
            int sameCh = 1;

            while (i + sameCh < content.length && content[i + sameCh] == ch) {
                sameCh++;
            }

            final switch (ch) {
                case '>':
                    writer.write("ptr+=", sameCh, ";\n");
                    break;
                case '<':
                    writer.write("ptr-=", sameCh, ";\n");
                    break;
                case '+':
                    writer.write("*ptr+=", sameCh, ";\n");
                    break;
                case '-':
                    writer.write("*ptr-=", sameCh, ";\n");
                    break;
                case '.':
                    writer.write("putchar(*ptr);\n");
                    break;
                case ',':
                    writer.write("*ptr=getchar();\n");
                    break;
                case '[':
                    writer.write("while(*ptr){\n");
                    break;
                case ']':
                    writer.write("}\n");
                    break;
            }

            i += sameCh;
        }

        writer.write("}\n");
        writer.close();
    } catch (Exception e) {
        writeln("File not found or an error occurred: ", e.msg);
    }
}
