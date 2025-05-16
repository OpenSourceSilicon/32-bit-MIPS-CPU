# 32-bit MIPS DLX CPU Implementation

A Verilog implementation of a 32-bit DLX (a MIPS derivative) RISC processor with pipelining support. This processor follows the DLX architecture, which is a RISC instruction set architecture developed for teaching purposes, based on the MIPS architecture.

## Architecture Overview

This implementation features a 32-bit RISC processor based on the DLX architecture with the following key characteristics:

- 32-bit data path width
- 5-stage pipeline architecture
- Hardware hazard detection and forwarding
- Branch prediction support
- Register file with forwarding logic
- Multiple ALU operations support
- Memory access capabilities

### Pipeline Stages

The processor implements a classic 5-stage RISC pipeline:

1. **Fetch (F)**: 
   - Fetches instruction from instruction memory
   - Updates Program Counter (PC)
   - Implements PC stalling logic for hazard handling

2. **Decode (D)**:
   - Decodes instruction using the Control Unit
   - Reads registers from Register File
   - Performs immediate value extension (Sign/Zero)
   - Implements branch target calculation
   - Features forwarding logic for branch resolution

3. **Execute (E)**:
   - Performs ALU operations
   - Handles data forwarding through multiple MUX units
   - Supports multiple operations including:
     - Arithmetic: ADD, SUB
     - Logical: AND, OR, XOR
     - Shifts: SLL, SRL, SRA
     - Comparisons: SEQ, SNE, SLT, SLE

4. **Memory (M)**:
   - Handles memory access operations
   - Performs memory read/write operations
   - Manages memory-to-register transfers

5. **Writeback (W)**:
   - Writes results back to register file
   - Handles result forwarding logic
   - Manages register write operations

### Supported Instructions

The CPU supports a rich set of DLX instructions including:

#### Arithmetic and Logical
- ADD, ADDI (Addition)
- SUB, SUBI (Subtraction)
- AND, ANDI (Logical AND)
- OR, ORI (Logical OR)
- XOR, XORI (Logical XOR)

#### Memory Operations
- LW (Load Word)
- SW (Store Word)
- LHI (Load High Immediate)

#### Branch and Jump
- BEQZ (Branch if Equal to Zero)
- BNEZ (Branch if Not Equal to Zero)
- J (Jump)
- JAL (Jump and Link)
- JALR (Jump and Link Register)
- JR (Jump Register)

#### Shift Operations
- SLLI (Shift Left Logical Immediate)
- SRLI (Shift Right Logical Immediate)
- SRAI (Shift Right Arithmetic Immediate)

#### Compare Operations
- SEQI (Set if Equal Immediate)
- SNEI (Set if Not Equal Immediate)
- SLTI (Set if Less Than Immediate)
- SLEI (Set if Less or Equal Immediate)

### Hazard Handling

The processor implements sophisticated hazard handling mechanisms:

1. **Data Hazards**:
   - Forward paths from Execute, Memory, and Writeback stages
   - Stall logic when forwarding isn't possible
   - Register file forwarding for dependent instructions

2. **Control Hazards**:
   - Branch prediction logic
   - Pipeline flush mechanism for mispredicted branches
   - Early branch resolution in Decode stage

3. **Structural Hazards**:
   - Separate instruction and data memory
   - Pipelined execution units
   - Resource conflict resolution

## Implementation Details

### Key Components

1. **Control Unit**: Manages instruction decoding and control signal generation
2. **ALU**: Supports multiple operations with 4-bit control signals
3. **Register File**: 32-bit width with forwarding support
4. **Hazard Unit**: Handles pipeline stalls and forwarding control
5. **Branch Unit**: Manages branch prediction and resolution
6. **Memory Interface**: Handles load/store operations

### Hardware Resources

- 32-bit data path
- 32-bit instruction width
- 32-bit general-purpose registers
- Parameterized design (WIDTH parameter)
- Multiple pipeline registers for stage isolation

## Usage

To use this CPU implementation:

1. Ensure you have a Verilog simulator installed
2. Clone the repository
3. Compile the Verilog files
4. Run simulation with your test bench

## File Structure

- `top_cpu.v`: Main CPU implementation with pipeline stages
- `ALU.v`: Arithmetic Logic Unit implementation
- `ControlUnit.v`: Instruction decoder and control signal generator
- Multiple supporting modules for pipeline stages and components

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for improvements and bug fixes.
