#!/bin/bash
#set today directory name 
a=$(echo back$(date +%y%m%d))
#check if there is same name directory
if [ -d $a ]
#same : today dircetory(+1)
then
	b=1
	while [ -d $a\($b\) ]
	do
	((b++))
	done
	mkdir $a\($b\)
#if not same : save the name directory
else
	mkdir $a
fi

# 1 스크립트를 실행할 쉘을 지정하는 선언문이다.

# 2 

# 3 date커맨드를 사용하고 앞에 back을 붙인 후 echo를 사용해서 출력 값을 변수 a에 넣는다.

# 4 

# 5 만약 디렉토리 이름이 a와 같다면

# 6 그렇다면 then 아래를 실행하도록 한다.

# 7 동일 디렉토리가 있으면 다르게 만들기 위해서 지정하는 변수이다.

# 8 만약 b를 넣은 값까지도 같은 이름의 디렉토리가 존재 할 때 까지

# 9 do 아래를 실행하도록 한다.

# 10 같은 이름을 방지하기 위해서 b의 값을 증가한다.

# 11  while문을 끝내준다.

# 12 증가한 b의 값을 가진 디렉토리를 만들어준다.

# 13 만약 이름이 같지 않다면

# 14 그 이름을 가진 디렉토리를 생성한다.

# 15 if문을 끝내준다. 끝내줘요~
