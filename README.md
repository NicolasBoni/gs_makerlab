# 🚀 Braço Robótico de Coleta de Amostras (Docking & Retrieval)

> Projeto desenvolvido para a disciplina **Project-Based Maker Lab (PBML)** da FIAP, com foco na manipulação de amostras em ambientes de microgravidade inspirados na indústria espacial.

---

## 👨‍💻 Integrantes

| Nome                    | RM       |
| ----------------------- | -------- |
| Nicolas Nogueira Boni   | RM551965 |
| Kaue Pastori Teixeira   | RM98501  |
| Guilherme Brazioli      | RM98237  |
| Enzo Vazquez Sartorelli | RM94618  |
| Pedro Oliveira Valotto  | RM551445 |

---

## 📖 Sobre o Projeto

O projeto consiste no desenvolvimento de um braço robótico conceitual para coleta de amostras em ambientes de microgravidade.

O sistema utiliza:

* 🤖 Arduino Uno
* ⚙️ 2 Servomotores SG90 9g
* 💡 LED de Status
* 🦾 Garra Robótica modelada em OpenSCAD
* 💻 Controle via Monitor Serial

O objetivo é simular a captura e movimentação de amostras através de comandos enviados pelo usuário.

---

## 🔗 Simulador

### Tinkercad

Acesse o projeto através do link:

👉 https://www.tinkercad.com/things/kV61az7cvYw-gs-braco

---

## 🕹️ Guia de Operação

### Configuração

* Baud Rate: **9600**
* Sem final de linha

### Comandos Disponíveis

| Comando | Ação         |
| ------- | ------------ |
| U       | Subir braço  |
| D       | Descer braço |
| O       | Abrir garra  |
| C       | Fechar garra |

### Funcionamento

Os servomotores são movimentados em incrementos controlados de **15°**, permitindo posicionamento gradual e preciso.

Para simular um cenário real, foram implementados limites de segurança. Movimentos além da faixa operacional poderiam gerar esforços excessivos e até a quebra de componentes mecânicos.

#### Braço Robótico

| Limite | Valor |
| ------ | ----- |
| Mínimo | 30°   |
| Máximo | 150°  |

#### Garra Robótica

| Limite | Valor |
| ------ | ----- |
| Mínimo | 45°   |
| Máximo | 135°  |

Também foi implementado um intervalo mínimo entre comandos para reduzir esforços mecânicos e simular uma operação mais próxima de sistemas robóticos reais.

---

## 🔌 Circuito Utilizado

### Componentes

* Arduino Uno R3
* 2x Servo SG90 9g
* LED Vermelho
* Resistor 220 Ω
* Cabos de conexão

### Ligações

#### Servo 1 — Movimento Vertical

| Servo | Arduino |
| ----- | ------- |
| Sinal | D9      |
| VCC   | 5V      |
| GND   | GND     |

#### Servo 2 — Garra

| Servo | Arduino |
| ----- | ------- |
| Sinal | D10     |
| VCC   | 5V      |
| GND   | GND     |

#### LED de Status

| Componente | Arduino                       |
| ---------- | ----------------------------- |
| Ânodo (+)  | D13 através de resistor 220 Ω |
| Cátodo (-) | GND                           |

---

## ⚙️ Especificações Técnicas

### Alimentação

Sistema alimentado em **5V**, compatível com os servomotores SG90.

### Firmware

Funcionalidades implementadas:

* ✅ Controle serial
* ✅ Movimentação angular controlada
* ✅ Limites de segurança
* ✅ Validação de comandos
* ✅ LED de status
* ✅ Proteção contra movimentações excessivas

---

## 🦾 Modelagem 3D

### Software Utilizado

**OpenSCAD**

Modelagem paramétrica desenvolvida para permitir ajustes rápidos através de variáveis.

### Aplicação

Garra robótica conceitual destinada à captura de amostras em ambiente de microgravidade.

### Compatibilidade

**Micro Servo SG90 9g**

---

### Servo SG90 Utilizado

| Parâmetro                 | Valor   |
| ------------------------- | ------- |
| Comprimento               | 23 mm   |
| Largura                   | 12,2 mm |
| Altura                    | 24 mm   |
| Folga de encaixe          | 1 mm    |
| Largura com orelhas       | 32 mm   |
| Espaçamento dos parafusos | 27,5 mm |

---

### Base

| Parâmetro   | Valor |
| ----------- | ----- |
| Largura     | 70 mm |
| Comprimento | 45 mm |
| Altura      | 8 mm  |

---

### Furos de Fixação

| Quantidade | Diâmetro |
| ---------- | -------- |
| 4          | 3,2 mm   |

Função: fixação da garra em uma estrutura maior do braço robótico.

---

### Furos do Servo

| Tipo                  | Quantidade | Diâmetro |
| --------------------- | ---------- | -------- |
| Parafusos das orelhas | 2          | 2,4 mm   |
| Eixo/Horn             | 1          | 7 mm     |

---

### Garras

#### Configuração

* Quantidade de garras: 2
* Comprimento: 55 mm
* Altura: 10 mm
* Espessura: 6 mm
* Espaçamento entre garras: 32 mm

#### Características

* Geometria paramétrica
* Design simétrico
* Estrutura otimizada para impressão 3D
* Dentes internos para aderência
* Compatibilidade com servo SG90

---

### Dentes

| Parâmetro        | Valor  |
| ---------------- | ------ |
| Dentes por garra | 5      |
| Total de dentes  | 10     |
| Largura          | 3 mm   |
| Altura           | 2,5 mm |

Função: melhorar a aderência durante a captura de amostras.

---

## 📸 Imagens do Projeto

### Circuito no Tinkercad

Caminho em:

```text
/images/Tinkercad
```

### Modelo 3D

Caminho em:

```text
/images/OpenScad
```

---

## 🎯 Resultados Obtidos

O projeto atendeu aos requisitos da disciplina:

* ✅ Simulação funcional do braço robótico
* ✅ Controle via Monitor Serial
* ✅ Modelagem 3D paramétrica
* ✅ Compatibilidade com Servo SG90
* ✅ Exportação STL
* ✅ Aplicação voltada à indústria espacial
* ✅ Manipulação de amostras em microgravidade

---

<div align="center">

### FIAP - Project Based Maker Lab

🛰️ Docking & Retrieval Robotic Arm

</div>
