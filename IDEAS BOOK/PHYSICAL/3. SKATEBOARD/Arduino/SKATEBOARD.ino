int LB = 9;
int RB = 10;
int LF = 11;
int RF = 12;

int val;

void setup() {
  Serial.begin(9600);
  pinMode(LB, OUTPUT);
  pinMode(RB, OUTPUT);
  pinMode(LF, OUTPUT);
  pinMode(RF, OUTPUT);
}

void loop()
{
if(Serial.available())
  {
  val = Serial.read();
  
    if(val == 1) //backward
    {
    digitalWrite(LB, LOW);
    digitalWrite(RB, LOW);
    digitalWrite(LF, HIGH);
    digitalWrite(RF, HIGH);
    }

      else if(val == 3) //forward
      {
      digitalWrite(LB, HIGH);
      digitalWrite(RB, HIGH);
      digitalWrite(LF, LOW);
      digitalWrite(RF, LOW);
      }

      
        else //still
        {
        digitalWrite(LB, HIGH);
        digitalWrite(RB, HIGH);
        digitalWrite(LF, HIGH);
        digitalWrite(RF, HIGH);
        }
  }
}
