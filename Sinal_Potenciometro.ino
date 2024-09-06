float analog=A0;
float Volt;
float oldVolt=0;

char c;

void setup() {
  Serial.begin(9600);

}

void loop() {
  if (Serial.available()>0) {
    c=Serial.read();
  }
    


  Volt=analogRead(analog);
  if (Volt!=oldVolt) {
    Serial.print("V: ");
    Serial.println(Volt);
    oldVolt=Volt;
    }
  delay(50);
}
