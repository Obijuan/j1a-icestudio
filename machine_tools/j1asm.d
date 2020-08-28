import std.algorithm;
import std.conv;
import std.file;
import std.path;
import std.range;
import std.stdio;
import std.string;

// one machine-code command
alias Instruction = ushort;
// one mnemonic
alias Command = Instruction[];
// all mnemonics
alias TranslationTable = Command[string];


// load all mnemonic from include file
auto loadMnemonics(string filename)
{
		File file;
		file.open(filename, "r");

		TranslationTable table;

		foreach (e; file.byLine)
		{
			// if not a comment
			if (!e.startsWith(`//`) && !e.empty)
			{
				auto source = e.strip.split("=");
				auto name = source[0].to!string;
				auto code = source[1]
									.split(",")
									.map!(a => a.strip.replace("x", ""))
									.map!(a => to!ushort(a, 16))
									.array;
									
				table[name] = code;
			}
		}

		scope(exit) file.close;

		return table;
}

// name of procedure or tag
alias Name = string;
// real address for jump or call
alias Address = ushort;
// address table for jumping
alias JumpTable = Address[Name];


// create jump table from listing
auto createJumpTable(string assemblerListing, TranslationTable translations, ref JumpTable jumps)
{
	string[] preparedListing = assemblerListing.strip.splitLines;
	Address address = 0;

	foreach (assemblerMnemonic; preparedListing)
	{
		string mnemonic = assemblerMnemonic.strip.split[0].strip;

		// base control instruction
		if ((mnemonic == "push" ) || (mnemonic == "jmp" ) || (mnemonic == "jz" ) || (mnemonic == "call" ))
		{
			address++;
		}

		// all procedure names ends with colon sign
		if (mnemonic.endsWith(":"))
		{
			string procedureName = mnemonic[0..$-1];
			jumps[procedureName] = address; 
		}

		// all tags starts with word "tag"
		if (mnemonic == "tag")
		{
			string tagName = assemblerMnemonic.strip.split[1].strip;
			jumps[tagName] = address;
		}

		// base commands (available mnemonics)
		if (mnemonic in translations)
		{
			address += translations[mnemonic].length;
		}
	}
}


// translate to machine code
auto toMachineCodes(string assemblerListing, TranslationTable translations, JumpTable jumps)
{
	Command command;
	string mnemonic, argument;
	string[] preparedListing = assemblerListing.strip.splitLines;

	foreach (assemblerMnemonic; preparedListing)
	{
		mnemonic = assemblerMnemonic.strip.split[0].strip;

		if (assemblerMnemonic.strip.split.length > 1)
		{
			argument = assemblerMnemonic.strip.split[1].strip;
		}
		else
		{
			argument = "";
		}

		switch (mnemonic)
		{
			case "push":
				command ~= 0x8000 | to!Instruction(argument);
				break;
			case "jmp":
				command ~= 0x0000 | jumps[argument];
				break;
			case "jz":
				command ~= 0x2000 | jumps[argument];
				break;
			case "call":
				command ~= 0x4000 | jumps[argument];
				break;
			case "ret":
				auto lastCommand = command[$-1];
				command[$-1] = 0x1000 | lastCommand;
				break;
			default:
				break;
		}

		if (mnemonic in translations)
		{
			command ~= translations[mnemonic];
		}
	}

	return command;
}

// create listing file
auto toListingFile(Command commands, string filename, size_t MEMORY_SIZE = 4_096)
{
	File file;
	with (file)
	{
		while (commands.length < MEMORY_SIZE)
		{
			commands ~= 0xffff;
		}

		open(filename, "w");

		foreach (command; commands)
		{
			writefln("%0.4x", command);
		}

		scope(exit) close;
	}
}

void main(string[] arguments)
{
	// structure of command-line arguments: [program_name argument_1 argument_2 ... argument_N]
	if (arguments.length < 3)
	{
		writeln("usage: j1asm <input_file> <output_file> [<include_file>]");
	}
	else
	{
		// if translation file not present
		string translationsFile;
		if (arguments.length < 4)
		{
			translationsFile = "j1a_codes.include";
			
			// default file not exists
			if (!translationsFile.exists)
			{
				writeln("No translations file found !");
			}
		}
		else
		{
			// path for translations file extracts from command-line arguments
			translationsFile = arguments[3];
		}

		// input file doesn't exists
		if (!arguments[0].exists)
		{
			writeln("Input file doesn't exists !");
		}
		else
		{
			auto assemblerListing = cast(string) std.file.read(arguments[1]);
			TranslationTable translations = loadMnemonics(translationsFile);
			JumpTable jumps;
			createJumpTable(assemblerListing, translations, jumps);
			assemblerListing
							.toMachineCodes(translations, jumps)
							.toListingFile(arguments[2]);
		}
	}
}