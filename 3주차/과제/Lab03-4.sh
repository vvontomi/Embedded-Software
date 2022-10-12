#!/bin/bash

a=$(echo back$(date +%y%m%d))

if [ -d $a ]
then 
	b=1
	while [ -d $a\($b\) ]
	do 
	((b++))
	done
	backd=$(echo $a\($b\))
	mkdir $backd
else 
	backd=$(echo $a)
	mkdir $backd
fi

fres=$(echo $(sudo find / -name "*.txt"))
idx=1
str=$(echo $fres | cut -d ' ' -f $idx)
while [ ! -z $str ]
do 
	fn=$(basename $str)
	if [ -f $backd/$fn ]
	then
		echo '$fn is exists.'
		j=1
		while [ -f $backd/$fn\($j\) ]
		do
			((j++))
		done
		cp $str $backd/$fn\($j\)
	else
		cp $str $backd/$fn
	fi
	((idx++))
	str=$(echo $fres | cut -d ' ' -f $idx)
done

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

# 12 

# 13 증가한 b의 값을 가진 디렉토리를 만들어준다.

# 14 만약 이름이 같지 않다면

# 15 그 이름을 가진 디렉토리를 생성한다.

# 17 if문을 끝내준다. 끝내줘요~

# 18

# 19 fres라는 변수에 .txt로 끝나는 이름을 가진 것을 찾아준다.

# 20 Field의 인덱스 값의 변수를 만들어준다.

# 21 str이라는 변수에 공백을 기준으로 5번째 Field를 추출하는 것을 변수에 저장한다.

# 22 만약 str이 0이 아닐때까지

# 23 do 아래문을 실행한다.

# 24 path/파일 문자열에서 파일명만 추출한다.

# 25 백업 디렉토리 안에 동일명의 파일이 존재하는지 검사한다.

# 26 if문이 참이면 then아래를 출력한다.

# 27 동일 파일이 존재할 때 다른 이름을 만들어야함으로 번호를 지정하는 변수를 만들어준다.

# 28 백업 디렉토리 안에 동일명, 동일번호 파일이 존재하는지 검사한다.

# 29 동일명, 동일 파일이 존재하는 경우 do 아래를 실행한다.

# 30 동일명, 동일 파일이 존재하는 경우 j 를 증가한다.

# 31 while문을 종료한다.

# 32 번호를 증가한 파일에 str을 backd에 복사한다.

# 33 백업 디렉토리 안에 동일명의 파일이 존재하지 않는다면

# 34  str을 backd에 복사한다.

# 35 if문을 끝낸다

# 36 인덱스 값을 증가한다.

# 37 fres를 인덱스 값에 따라 공백단위로 자른 것을 출력하는 변수를 만든다.

# 38 while문을 종료한다.