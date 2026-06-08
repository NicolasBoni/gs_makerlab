#include <Servo.h>

// Objetos dos servomotores
Servo servoBraco;
Servo servoGarra;

// Pinos utilizados
const int pinoServoBraco = 9;
const int pinoServoGarra = 10;
const int pinoLed = 13;

// Limites seguros de operação
const int LIMITE_MIN_BRACO = 30;
const int LIMITE_MAX_BRACO = 150;

const int LIMITE_MIN_GARRA = 45;
const int LIMITE_MAX_GARRA = 135;

// Incremento de movimentação
const int PASSO = 15;

// Tempo mínimo entre comandos (ms)
const int TEMPO_ESPERA = 500;

// Posições iniciais
int anguloBraco = 90;
int anguloGarra = 90;

void setup() {

  Serial.begin(9600);

  servoBraco.attach(pinoServoBraco);
  servoGarra.attach(pinoServoGarra);

  pinMode(pinoLed, OUTPUT);

  // Posiciona os servos em posição neutra
  servoBraco.write(anguloBraco);
  servoGarra.write(anguloGarra);

  // LED indica sistema pronto
  digitalWrite(pinoLed, HIGH);

  Serial.println("=== BRACO ROBOTICO DE COLETA DE AMOSTRAS ===");
  Serial.println("Sistema iniciado com limites de seguranca.");
  Serial.println("--------------------------------------------");
  Serial.println("Comandos disponiveis:");
  Serial.println("U - Up (Subir braco)");
  Serial.println("D - Down (Descer braco)");
  Serial.println("O - Open (Abrir garra)");
  Serial.println("C - Close (Fechar garra)");
  Serial.println("--------------------------------------------");
}

void loop() {

  if (Serial.available() > 0) {

    char comando = toupper(Serial.read());

    // Pisca LED para indicar recebimento do comando
    piscarLedStatus();

    switch (comando) {

      case 'U':

        if (anguloBraco + PASSO <= LIMITE_MAX_BRACO) {

          anguloBraco += PASSO;
          servoBraco.write(anguloBraco);

          Serial.print("Braco subiu para ");
          Serial.print(anguloBraco);
          Serial.println(" graus.");

        } else {

          Serial.println("Limite seguro atingido: o braco nao pode subir mais.");

        }

        break;

      case 'D':

        if (anguloBraco - PASSO >= LIMITE_MIN_BRACO) {

          anguloBraco -= PASSO;
          servoBraco.write(anguloBraco);

          Serial.print("Braco desceu para ");
          Serial.print(anguloBraco);
          Serial.println(" graus.");

        } else {

          Serial.println("Limite seguro atingido: o braco nao pode descer mais.");

        }

        break;

      case 'O':

        if (anguloGarra + PASSO <= LIMITE_MAX_GARRA) {

          anguloGarra += PASSO;
          servoGarra.write(anguloGarra);

          Serial.print("Garra abriu para ");
          Serial.print(anguloGarra);
          Serial.println(" graus.");

        } else {

          Serial.println("Limite seguro atingido: a garra nao pode abrir mais.");

        }

        break;

      case 'C':

        if (anguloGarra - PASSO >= LIMITE_MIN_GARRA) {

          anguloGarra -= PASSO;
          servoGarra.write(anguloGarra);

          Serial.print("Garra fechou para ");
          Serial.print(anguloGarra);
          Serial.println(" graus.");

        } else {

          Serial.println("Limite seguro atingido: a garra nao pode fechar mais.");

        }

        break;

      default:

        Serial.println("Comando invalido. Utilize apenas U, D, O ou C.");

        break;
    }

    // Pequena pausa para evitar comandos excessivamente rápidos
    delay(TEMPO_ESPERA);
  }
}

// Função para indicar atividade do sistema
void piscarLedStatus() {

  digitalWrite(pinoLed, LOW);
  delay(150);

  digitalWrite(pinoLed, HIGH);
}