#!/bin/bash
flutter build apk --split-per-abi && 
cd ./build/app/outputs/apk/release/ && 
adb install app-arm64-v8a-release.apk &&
