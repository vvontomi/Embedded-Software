#!/bin/bash

a=1
str=$(echo $PATH | cut -d ':' -f $a)
while [ ! -z $str ] 
do 
	echo $str
	((a++))
	str=$(echo $PATH | cut -d ':' -f $a)
done

# 1 스크립트를 실행할 쉘을 지정하는 선언문이다.

# 2 

# 3 $PATH의 값을 읽어서 한줄에 한 Path 씩 출력하기 위해서 지정하는 변수이다.

# 4 PATH를 : 를 기준으로 잘라주고, str이라는 변수로 받아준다.

# 5 만약 str에서의echo $PATH를 : 를 기준으로 자른 출력 값이 0이라면

# 6 do 아래문을 실행한다.

# 7 str을 출력한다.

# 8 다음 : 로 끝나는 Path를 출력하기 위해서 a를 증가시킨다.

# 9 증가 한 a 값으로 다음 : 로 끝나는 Path를 출력한다.

# 10 while문을 끝내준다.