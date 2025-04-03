# cseg-uvm-project

## Roadmap

1. Decidir grupos
2. Criar ambiente (git, ...)
3. Explorar projeto multiplicadores
4. Explorar projeto processador
5. Separar atividades grupo (FPV, SVA, coverage)

## FPV
-

## SVA
-

## Coverage
- Todos os items de coverage devem estar acima de 95%.

### ALU
- Branches
  - 8/9 (último case)

  

---

### ✅ **Tabela Corrigida e Revisada**

## Instruction Format  
Instructions are 16-bit wide and formatted as follows:

| Type            | 15-12   | 11-9   | 8-6   | 5-3   | 2-0    |
|-----------------|---------|--------|-------|-------|--------|
| R (register)    | Opcode  | Rd     | Ra    | Rb    | Func   |
| I (immediate)   | Opcode  | Rd     | Ra    | Imm[5:0] *(bits 5-0)* |
| J (jump)        | Opcode  | [11:8] don't care | Addr[7:0] *(bits 7-0)* |

---

## Instruction Set

| Instruction      | Opcode / Func | Type | Operation                      | AluControl (OLD) |
|------------------|---------------|------|--------------------------------|------|
| ADD rd, ra, rb   | 0000 / 000    | R    | rd = ra + rb                   | 000  |
| SUB rd, ra, rb   | 0000 / 010    | R    | rd = ra - rb                   | 001  |
| AND rd, ra, rb   | 0000 / 100    | R    | rd = ra AND rb                 | 010  |
| OR  rd, ra, rb   | 0000 / 101    | R    | rd = ra OR rb                  | 011  |
| XOR rd, ra, rb   | 0000 / 001    | R    | rd = ra XOR rb                 | 100  |
| BIC rd, ra, rb   | 0000 / 011    | R    | rd = ra & ~rb                  | 101  |
| RSB rd, ra, rb   | 0000 / 111    | R    | rd = rb - ra                   | 110  |
| ADDI rd, ra, imm | 0100          | I    | rd = ra + imm                  |      |
| LW rd, imm(ra)   | 1011          | I    | rd = DMEM[ra + imm]            |      |
| SW rd, imm(ra)   | 1111          | I    | DMEM[ra + imm] = rd            |      |
| BEQ rd, ra, imm  | 1000          | I    | if (rd == ra) pc = pc + imm    | 111  |
| J addr           | 0010          | J    | pc = addr                      |      |

---

1. **Campos corrigidos na tabela de formato:**
   - Na instrução tipo **I (immediate)**, o campo de **Imm** utiliza 6 bits `[5:0]` ao invés de 3 bits.
   - Na instrução tipo **J (jump)**, explicitou-se corretamente o tamanho do endereço como 8 bits `[7:0]`.

2. **Instruções corrigidas na tabela Instruction Set:**
   - **XOR** estava com o mesmo código da operação **OR**. Foi corrigido para utilizar o mesmo `func` do código definido na ALU (`100`).
   - **BIC** e **RSB** estavam com códigos errados (`101`). Foram corrigidos para `BIC = 101` e `RSB = 110`, conforme definido na ALU.
   - A instrução **BEQ** estava incorretamente especificada usando `(ra == rb)`; foi corrigida para `(rd == ra)` para ficar coerente com a arquitetura apresentada.
   - A operação **Jump (J)** estava incorretamente definida como `pc = addr + addr`, o que não faz sentido. Foi corrigida para `pc = addr`.

3. **Consistência com módulos ControlUnit.sv e ALU.sv:**
   - Os códigos atribuídos a cada operação agora correspondem diretamente aos valores definidos no módulo `ALU.sv`.
   - A instrução tipo J (`jump`) não faz uso dos campos de registradores intermediários, o que foi mantido corretamente na tabela revisada.
   - As instruções de acesso à memória (`LW`, `SW`) e operações imediatas (`ADDI`) estão consistentes com os sinais de controle especificados em `ControlUnit.sv`.

4. **Sugestões adicionais:**
   - Seria ideal que as instruções **BEQ** e **Jump (J)** fossem melhor documentadas quanto ao cálculo do endereço destino, se devem usar deslocamento relativo (BEQ) ou endereço absoluto (J).
   - A definição de como o valor de `imm` será tratado (complemento de dois, sinal, ou absoluto) também deveria ser explicitada na documentação do processador.

