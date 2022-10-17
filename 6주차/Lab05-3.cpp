
// c++
const int LED = 11; //led 연결 핀
const int BUTTON = 2; //m-m cable

int pause = 0; //pause 기능
int isUp= 1; // 상태 나타내기 위한 변수
int i = 0; 
int pause_state = 0; //현재 상태가 pause인지 파악

void sw_pressed(){ //스위치를 눌렀을 때 
  if(pause == 0){ //pause가 0이면
    pause = 1; //pause면 1로 변경 하도록 한다.
  }
  else if(pause ==1){
    pause = 0;
  }
  pause_state = i; //현재 상태를 저장한다.
}

void setup() 

{
  pinMode(BUTTON, INPUT); //3.3V에서 입력, 
  pinMode(LED,OUTPUT); //led로 출력한다.
  Serial.begin(9600);
  attachInterrupt(digitalPinToInterrupt(BUTTON),sw_pressed, RISING);
}// 핀이 BUTTON 일 때 Interrupt가 되고, sw_pressed 함수를 실행 시키고, RISING은 LOW를 HIGH로 바꾼다.

void loop()
{
  if(pause == 0){ //pause가 0이고, 

  if(isUp == 1){ //스위치를 키도록하면 
    for(i=pause_state; i<255; i++) //PWM으로 제어해서 점점 밝기를 높힌다.
  
    {
  
      analogWrite(LED,i); //LED핀의 전압을 i로 한다.
  
      delay(10);
  
    }
    isUp = 0; //아래에 있는 if문으로 들어가게 하기 위해서 0으로 바꾸어준다.
    pause_state = 255; //인터럽트 경우를 위해서 현재 상태도 255로 변경해준다.
  }

  if(isUp == 0){
    for(i=pause_state; i>0; i--) 
  
    {
  
      analogWrite(LED,i);
  
      delay(10);

     }
     isUp = 1; 
     pause_state = 0;
  }
 }

 else if (pause == 1){ //pause가 1일때는 
    analogWrite(LED, pause_state); //i값이 아닌 현재상태를 받아서 변화가 정지되었던 시점부터 다시 변화하도록 한다.
 }
 
}
```