import std.conv : to;

// 16-разрядное беззнаковое целое
alias int16 = short; 
// 16-разрядное беззнаковое целое
alias uint16 = ushort;

class J1_CPU
{
	private
	{
		enum RAM_SIZE = 16_384;
		// стек данных
		uint16[33] dataStack;
		// стек вызовов
		uint16[32] returnStack;
		// память
		uint16[RAM_SIZE] RAM;
		// указатель на вершину стека данных
		int16 dataPointer;
		// указатель на вершину стека вызовов
		int16 returnPointer;
		// счетчик инструкций
		uint16 programCounter;

		// маски для различения типов инструкций j1
		enum J1_INSTRUCTION : uint16
		{
			JMP    =  0x0000,
			JZ     =  0x2000,
			CALL   =  0x4000,
			ALU    =  0x6000,
			LIT    =  0x8000
		};

		// маски для различения аргументов инструкций j1
		enum J1_DATA : uint16
		{
			LITERAL = 0x7fff,
			TARGET  = 0x1fff
		};

		// исполнение команд АЛУ
		auto executeALU(uint16 instruction)
		{
			uint16 q;
			uint16 t;
			uint16 n;
			uint16 r;

			// вершина стека
			if (dataPointer > 0)
			{
				t = dataStack[dataPointer];
			}

			// элемент под вершиной стека
			if (dataPointer > 0)
			{
				n = dataStack[dataPointer - 1];
			}

			// предыдущий адрес возврата
			if (returnPointer > 0)
			{
				r = returnStack[returnPointer - 1];
			}

			// увеличить счетчик инструкций
			programCounter++;

			// извлечение кода операции АЛУ
			uint16 operationCode = (instruction & 0x0f00) >> 8;

			// опознание операций
			switch (operationCode)
			{
				case 0:
					q = t;
					break;
				case 1:
					q = n;
					break;
				case 2:
					q = to!uint16(t + n);
					break;
				case 3:
					q = t & n;
					break;
				case 4:
					q = t | n;
					break;
				case 5:
					q = t ^ n;
					break;
				case 6:
					q = to!uint16(~to!int(t));
					break;
				case 7:
					q = (t == n) ? 1u : 0u;
					break;
				case 8:
					q = (to!int16(n) < to!int16(t)) ? 1u : 0u;
					break;
				case 9:
					q = n >> t;
					break;
				case 10:
					q = to!uint16(t - 1u);
					break;
				case 11:
					q = returnStack[returnPointer];
					break;
				case 12:
					q = RAM[t];
					break;
				case 13:
					q = to!uint16(n << t);
					break;
				case 14:
					q = to!uint16(dataPointer + 1u);
					break;
				case 15:
					q = (n < t) ? 1u : 0u;
					break;
				default:
					break;
			}

			// код действия с указателем на стек данных 
			// (+1 - увеличить указатель,  0 - не трогать, -1 уменьшить (= 2 в двоичном коде))
			uint16 ds = instruction & 0x0003;
			// код действия с указателем на стек возвратов
			// (+1 - увеличить указатель,  0 - не трогать, -1 уменьшить (= 2 в двоичном коде))
			uint16 rs = (instruction & 0x000c) >> 2;

			switch (ds)
			{
				case 1:
					dataPointer++;
					break;
				case 2:
					dataPointer--;
					break;
				default:
					break;
			}

			switch (rs)
			{
				case 1:
					returnPointer++;
					break;
				case 2:
					returnPointer--;
					break;
				default:
					break;
			}

			// флаг NTI
			if ((instruction & 0x0020) != 0)
			{
				RAM[t] = n;
			}

			// флаг TR
			if ((instruction & 0x0040) != 0)
			{
				returnStack[returnPointer] = t;
			}

			// флаг TR
			if ((instruction & 0x0080) != 0)
			{
				dataStack[dataPointer-1] = t;
			}

			// флаг RPC
			if ((instruction & 0x1000) != 0)
			{
				programCounter = returnStack[returnPointer];
			}

			if (dataPointer >= 0)
			{
				dataStack[dataPointer] = q;
			}
		}
	}

	public
	{
		auto execute(uint16 instruction)
		{
			// опознать тип инструкции
			uint16 instructionType = instruction & 0xe000;
			// операнд над которым осуществляется инструкция
			uint16 operand = instruction & J1_DATA.TARGET;

			// распознать конкретную инструкцию процессора
			switch (instructionType)
			{
				// безусловный переход
				case J1_INSTRUCTION.JMP:
					programCounter = operand;
					break;
				// переход на адрес, если на вершине стека 0
				case J1_INSTRUCTION.JZ:
					if (dataStack[dataPointer] == 0)
					{
						programCounter = operand;
					}
					else
					{
						programCounter++;
					}
					dataPointer--;
					break;
				// передать управление на адрес
				case J1_INSTRUCTION.CALL:
					returnPointer++;
					returnStack[returnPointer] = to!uint16(programCounter + 1);
					programCounter = operand;
					break;
				// выполнить инструкцию АЛУ
				case J1_INSTRUCTION.ALU:
					executeALU(operand);
					break;
				// положить на стек литерал
				case J1_INSTRUCTION.LIT:
					operand = instruction & J1_DATA.LITERAL;
					dataPointer++;
					dataStack[dataPointer] = operand; 
					programCounter++;
					break;
				default:
					break;
			}
		}

		this()
		{
			this.RAM = new uint16[RAM_SIZE];
			
			this.dataPointer = 0;
			this.returnPointer = 0;
			this.programCounter = 0;
		}

		void print()
		{
			writeln("[rs] : ", dataStack);
			writeln("[rs] : ", returnStack);
		}

		void executeProgram()
		{
			// 0xffff = HALT
			while (RAM[programCounter] != 0xffff)
			{
				writefln("{pc : %d, instruction : %0.4x}", programCounter, RAM[programCounter]);
				// RAM.toMIF("dump.mif");
				execute(RAM[programCounter]);
				print;
			}
		}

		void setMemory(uint16[RAM_SIZE] ram)
		{
			this.RAM = ram;
		}

		auto getMemory()
		{
			return RAM;
		}
	}
}

import std.algorithm;
import std.conv;
import std.file;
import std.range;
import std.string;
import std.stdio;

// превратить в файл инициализации Альтеры
auto toMIF(uint16[16_384] command, string filename, ushort depth = 16_384)
{
	enum string HEADER = 
`-- Quartus II generated Memory Initialization File (.mif)
WIDTH=16;
DEPTH=%d;
ADDRESS_RADIX=HEX;
DATA_RADIX=HEX;
CONTENT BEGIN
`;
	
	File file;
	file.open(filename, "w");
	file.writef(HEADER, depth);

	for (ushort i = 0; i < command.length; i++)
	{
		string index = format("%0.4x", i).toUpper;
		string data = format("%0.4x", command[i]).toUpper;
		file.writefln("\t%s : %s;", index, data);
	}
	file.write("END;");
}

auto fromMIF(string filename)
{
	ushort[16_384] commands;
	auto content = cast(string) std.file.read(filename);
	auto begin = content.indexOf("CONTENT BEGIN") + "CONTENT BEGIN".length;
	auto end = content.indexOf("END;");
	content = content[begin..end].strip;

	foreach (index, line; content.splitLines)
	{
		auto separatorIndex = line.indexOf(":") + 1;
		auto dataLine = line[separatorIndex..$-1].strip.toLower;
		commands[index] = parse!ushort(dataLine, 16);
	}

	return commands;
}

void main(string[] args)
{
	J1_CPU j1 = new J1_CPU;
	
	uint16[16_384] ram = fromMIF(args[1]);
	
	j1.setMemory(ram);
	j1.executeProgram;
}