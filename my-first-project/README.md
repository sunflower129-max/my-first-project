\# 나의 첫 개발 환경 만들기



\## 1. 프로젝트 소개



터미널로 파일과 폴더를 다루는 방법을 배우고, Docker를 설치해 시험용 프로그램을 실행한 과정을 기록한 프로젝트입니다.



목표는 다른 사람도 이 문서를 보고 실습 과정을 이해할 수 있도록 정리하는 것입니다.



현재는 터미널 기본 실습과 Docker 설치, hello-world 실행까지 완료했습니다. 나머지 과제는 진행하면서 추가할 예정입니다.



\## 2. 사용 환경



\- 운영체제: Windows

\- 명령어를 입력한 프로그램: Windows PowerShell

\- 컴퓨터 구조: AMD64

\- Docker 버전: 29.9.2, build a82e528

\- Docker 실행 도구: Docker Desktop

\- Git 버전: 아직 확인하지 않음



\## 3. 진행 상황



\- \[x] 작업 폴더 만들기

\- \[x] 현재 위치와 파일 목록 확인하기

\- \[x] 숨김 파일을 포함한 목록 확인하기

\- \[x] 파일 만들기와 내용 읽기

\- \[x] 파일 복사와 이름 변경하기

\- \[x] 파일 이동과 삭제하기

\- \[x] 폴더 이동과 삭제하기

\- \[x] 빈 파일 만들기

\- \[x] 명령어 이력 저장하기

\- \[x] 명령어와 실행 결과를 함께 기록하기

\- \[x] Docker 설치 및 버전 확인

\- \[x] hello-world 실행 성공

\- \[ ] Linux 파일·폴더 권한 실습

\- \[ ] Docker 상세 상태 확인

\- \[ ] Ubuntu 컨테이너 실행

\- \[ ] 이미지·컨테이너 운영 명령 실습

\- \[ ] Dockerfile 직접 작성

\- \[ ] 웹 서버 이미지 빌드 및 실행

\- \[ ] 포트 매핑과 브라우저 접속 확인

\- \[ ] 바인드 마운트 변경 반영 확인

\- \[ ] 볼륨 데이터 유지 확인

\- \[ ] Git 설정과 GitHub·VSCode 연동



\## 4. 터미널 기본 실습



다음 명령을 Windows PowerShell에서 실행했습니다.



아래 코드 블록은 수행한 명령을 정리한 것입니다. 당시 출력 전체를 그대로 옮긴 기록은 아닙니다.



\### 작업 폴더 만들기와 이동



```powershell

mkdir my-first-project

cd my-first-project

```



확인 결과: 입력 줄 끝에 `my-first-project`가 표시되어 폴더 안으로 이동했음을 확인했습니다.



\### 내용이 있는 파일 만들기와 읽기



```powershell

"나의 첫 개발 연습입니다" | Out-File memo.txt -Encoding utf8

Get-Content memo.txt

```



확인한 출력:



```text

나의 첫 개발 연습입니다

```



\### 파일 목록 확인



```powershell

dir

dir -Force

```



확인 결과: `memo.txt`가 목록에 나타났습니다. `-Force`를 붙이면 숨김 파일도 포함해 확인할 수 있습니다.



\### 파일 복사와 이름 변경



```powershell

Copy-Item memo.txt memo-copy.txt

Rename-Item memo-copy.txt memo-backup.txt

dir

```



확인 결과: 원본 `memo.txt`와 이름을 바꾼 복사본 `memo-backup.txt`가 보였습니다.



\### 파일 이동과 삭제



```powershell

mkdir practice

Move-Item memo-backup.txt practice

dir practice

Remove-Item practice/memo-backup.txt

dir practice

Remove-Item practice

dir

```



확인 결과:



\- `practice` 폴더 안으로 파일이 이동했습니다.

\- 파일 삭제 후 해당 폴더가 비어 있었습니다.

\- 빈 폴더도 삭제했습니다.

\- 원본 `memo.txt`는 남아 있었습니다.



\### 현재 위치와 폴더 이동 확인



```powershell

pwd

cd ..

cd my-first-project

```



확인 결과: 상위 폴더로 나갔다가 과제 폴더로 다시 들어왔습니다.



학습 내용:



\- 절대 경로: 위치를 처음부터 끝까지 적은 전체 주소

\- 상대 경로: 현재 폴더를 기준으로 적은 주소

\- `..`: 현재 폴더의 한 단계 위 폴더



\### 빈 파일 만들기



```powershell

New-Item empty.txt -ItemType File

dir

```



확인 결과: `empty.txt`가 생성되었으며, 내용이 없는 파일임을 확인했습니다.



\## 5. 실습 기록 파일



\### 명령어 이력 저장



```powershell

Get-History | Out-File practice-history.txt -Encoding utf8

Get-Content practice-history.txt

```



이 파일은 해당 PowerShell 창에서 입력한 명령어 이력입니다. 실행 결과 전체를 포함하지는 않습니다.



\- \[명령어 이력 보기](practice-history.txt)



\### 명령어와 출력 함께 저장



```powershell

Start-Transcript -Path terminal-log.txt

pwd

dir -Force

Get-Content memo.txt

Stop-Transcript

```



메모장으로 파일을 열어 명령어와 실행 결과가 기록된 것을 확인했습니다.



\- \[터미널 실행 기록 보기](terminal-log.txt)



\## 6. Docker 버전 확인



실행 명령:



```powershell

docker --version

```



실제 출력:



```text

Docker version 29.9.2, build a82e528

```



\## 7. hello-world 실행



실행 명령:



```powershell

docker run hello-world

```



실제 출력:



```text

Unable to find image 'hello-world:latest' locally

latest: Pulling from library/hello-world

4f55086f7dd0: Pull complete

d5e71e642bf5: Download complete

Digest: sha256:c567b231f65614688711a75f31518a064258a51d442117a3e771a3a8fdba78ef

Status: Downloaded newer image for hello-world:latest



Hello from Docker!

This message shows that your installation appears to be working correctly.



To generate this message, Docker took the following steps:

&#x20;1. The Docker client contacted the Docker daemon.

&#x20;2. The Docker daemon pulled the "hello-world" image from the Docker Hub.

&#x20;   (amd64)

&#x20;3. The Docker daemon created a new container from that image which runs the

&#x20;   executable that produces the output you are currently reading.

&#x20;4. The Docker daemon streamed that output to the Docker client, which sent it

&#x20;   to your terminal.



To try something more ambitious, you can run an Ubuntu container with:

&#x20;$ docker run -it ubuntu bash



Share images, automate workflows, and more with a free Docker ID:

&#x20;https://hub.docker.com/



For more examples and ideas, visit:

&#x20;https://docs.docker.com/get-started/

```



\### 결과 해석



1\. 컴퓨터에 hello-world 이미지가 없어서 인터넷에서 내려받았습니다.

2\. 내려받은 이미지로 컨테이너를 만들고 실행했습니다.

3\. `Hello from Docker!`가 출력되었습니다.

4\. Docker가 실제로 프로그램을 실행할 수 있음을 확인했습니다.



처음의 `Unable to find image` 문장은 이번 실행에서는 실패를 뜻하지 않았습니다. 필요한 이미지를 내려받은 뒤 정상 실행됐습니다.



\## 8. 문제 해결 기록



\### 문제 1: docker 명령어를 찾지 못함



\*\*문제\*\*



PowerShell에서 `docker --version`을 실행했지만, docker를 명령어로 인식하지 못한다는 오류가 나왔습니다.



\*\*원인 가설\*\*



Docker가 설치되지 않았거나, PowerShell에서 프로그램 위치를 찾지 못하는 상태라고 생각했습니다.



\*\*확인\*\*



Windows 설정의 설치된 앱 목록에서 Docker를 검색했지만 결과가 없었습니다.



\*\*해결\*\*



Docker 공식 사이트에서 AMD64 컴퓨터에 맞는 x86\_64용 Docker Desktop 설치 파일을 내려받아 설치를 진행했습니다. 설치와 재시작 후 새 PowerShell에서 버전이 정상 출력되었습니다.



\### 문제 2: 필수 Windows 기능이 꺼져 있어 설치 실패



\*\*문제\*\*



Docker 설치 화면에 다음 안내가 나타났습니다.



```text

Docker Desktop requires the "Virtual Machine Platform" Windows feature,

which is not enabled on this machine.

```



\*\*원인 가설\*\*



Docker 실행에 필요한 Windows 기능이 활성화되지 않은 상태라고 생각했습니다.



\*\*확인\*\*



설치 화면에서 해당 기능을 켜려면 관리자 권한이 필요하다는 안내를 확인했습니다.



\*\*해결 과정\*\*



관리자 권한 PowerShell에서 다음 명령을 실행하도록 안내받았습니다.



```powershell

wsl --install

```



이후 Docker 설치와 컴퓨터 재시작을 완료했습니다. 당시 WSL 설치 명령의 출력은 별도로 보관하지 못했습니다.



최종적으로 `docker run hello-world`가 성공한 것을 확인했습니다.



\### 문제 3: 첫 약관 화면을 닫아 Docker가 시작되지 않음



\*\*문제\*\*



Docker Desktop 설치 후 실행 화면을 찾지 못했습니다.



\*\*확인\*\*



처음 표시된 약관 화면에서 `Accept` 대신 `Close`를 클릭했던 것을 확인했습니다.



\*\*해결\*\*



Docker Desktop을 다시 실행해 약관 동의 단계를 진행했고, 컨테이너 목록 화면이 열렸습니다.



\## 9. 지금까지 배운 점



\- 터미널은 글자로 컴퓨터에 작업을 지시하는 도구입니다.

\- 폴더는 파일을 모아 두는 공간입니다.

\- 명령어 실행 후 목록이나 내용을 확인해야 실제로 작업이 되었는지 알 수 있습니다.

\- Docker 이미지는 실행에 필요한 준비물이고, 컨테이너는 그 이미지로 실행한 환경입니다.

\- 설치 성공 여부는 화면만 보는 것보다 실제 프로그램을 실행해 확인하는 것이 확실합니다.

\- 과제에는 명령어뿐 아니라 출력 결과도 함께 남겨야 합니다.



\## 10. 다음 할 일



Docker 상세 상태를 확인하고 Ubuntu 컨테이너 실행을 연습할 예정입니다. 이후 웹 서버, 포트 연결, 저장 공간 실험을 진행하면서 이 문서를 업데이트하겠습니다.

