## build in docker

- Make isolated env using docker
  
  ```bash
  mkdir -p ~/test/shared && cd ~/test
  docker run --name compile -it -d -v $(pwd)/shared:/mnt ubuntu:latest
  docker exec -it <name> bash
  apt update && apt upgrade -y
  apt install fish wget micro git openjdk-11-jdk unzip -y
  fish
  ```

- Install Android Build tools
  
  ```bash
  cd /root
  wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
  unzip commandlinetools-linux-8512546_latest.zip
  mkdir -p /root/android-sdk
  mv /root/cmdline-tools/ ~/android-sdk/
  mkdir -p /root/android-sdk/cmdline-tools/latest
  cd /root/android-sdk/cmdline-tools/
  mv bin/ lib/ source.properties NOTICE.txt latest/
  yes | /root/android-sdk/cmdline-tools/latest/bin/sdkmanager --licenses
  /root/android-sdk/cmdline-tools/latest/bin/sdkmanager "build-tools;33.0.0"
  export PATH=/root/android-sdk/cmdline-tools/latest/bin/:$PATH
  export ANDROID_HOME=/root/android-sdk
  ```

- Build app
  
  ```bash
  cd /mnt
  git clone https://github.com/whew-inc/FakeGApps
  cd FakeGApps
  ./gradlew assembleDebug
  # app will be in your home dir ~/test/FakeGApps/app/build/outputs/apk/debug/app-debug.apk
  ```

- References
  - https://developer.android.com/studio/build/building-cmdline
  - https://developer.android.com/studio/command-line
  - https://developer.android.com/studio/command-line
  - https://developer.android.com/studio/command-line/variables#envar
  - https://developer.android.com/studio/command-line/sdkmanager
  - [ubuntu - &quot;sdkmanager: command not found&quot; after installing Android SDK - Stack Overflow](https://stackoverflow.com/questions/53994924/sdkmanager-command-not-found-after-installing-android-sdk)
  - [&quot;Failed to install the following Android SDK packages as some licences have not been accepted&quot; error - Stack Overflow](https://stackoverflow.com/questions/54273412/failed-to-install-the-following-android-sdk-packages-as-some-licences-have-not)
  - [android - How to set ANDROID_HOME path in ubuntu? - Stack Overflow](https://stackoverflow.com/questions/26256279/how-to-set-android-home-path-in-ubuntu)
