// C++ code

volatile byte butPressed = LOW; //interrput를 사용하기 위해서 volatile를 사용한다. 
int note[] = {262, 294 , 330, 349, 392, 440, 494, 523}; // 도, 레, 미, 파, 솔, 라, 시, 도 
int note_number[] = {2,1,0,1,2,7,7,5,4,2,0}; //멜로디를 만들기 위한 노트 배열을 받음
int duration[] = {750,250,750,250,1000,1000,2000,2000,750,250,750}; //멜로디 지연시간을 설정하기 위한 배열


void sw_pressed(){ //스위치를 눌렀을 때
  if(butPressed == HIGH){ // 버튼이 HIGH이면 
    butPressed = LOW; // LOW로 변경 하도록 한다.
  }
  else{
    butPressed = HIGH; // 버튼이 LOW이면 HIGH로 변경한다.
  } 
  Serial.println("Interrupt!!!!!"); 
}

void setup() //가장 먼저 실행되는 함수 setup
{
  pinMode(A0, INPUT); 조도센서가 3.3V에서 A0로 INPUT이 된다.
  pinMode(2, INPUT); 스위치가 3.3V에서 2로 INPUT이 된다.
  pinMode(12, OUTPUT);
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(2),sw_pressed, RISING); 
	//핀이 2일 때 Interrupt가 되고, sw_pressed 함수를 실행 시키고, RISING은 LOW를 HIGH로 바꾸는 것이다.
}

void loop() //setup이 실행된 후 loop함수가 실행된다.
{
  Serial.println(butPressed); //버튼이 HIGH인지 LOW인지 파악하기 위해서 출력한다.
  int readValue = analogRead(A0); //A0 를 아날로그 전압을 읽는다.
  if(readValue > 350 && butPressed == HIGH){ //만약 빛이 350 이상이거나 버튼이 HIGH 이고, 
    for(int i = 0; i<11 ; i++){ 
      if(butPressed == HIGH){ 
        tone(9, note[note_number[i]], duration[i]); 
        delay(duration[i]);
				//멜로디를 만들기 위한 배열과 지연시간을 설정해둔 배열에서 하나씩 가져와서 읽도록 한다.
      }
      else{
        break;
      }
    } 
   if(butPressed == HIGH){ //버튼이 HIGH라면
		digitalWrite(12, HIGH); //digitalWrite를 사용하여서 주어진 핀번호에 대해 값을 입력한다. 
    } 
   else{
      	digitalWrite(12,LOW);
    }   
   if(butPressed == HIGH){
   		delay(2000); //스위가 Enablet 상태면 음악을 2초 후에 반복하도록 한다. 
    }
 }
}