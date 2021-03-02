# rm -rf x86_mac x64_mac arm64_mac arm32_mac universal_mac
mkdir x86_mac x64_mac arm64_mac arm32_mac
make CC="$(xcrun --sdk macosx --find clang) -isysroot $(xcrun --sdk macosx --show-sdk-path) -arch x86_64" OBJ_DIR32=x86_mac OBJ_DIR64=x64_mac
make CC="$(xcrun --sdk macosx --find clang) -isysroot $(xcrun --sdk macosx --show-sdk-path) -arch arm64" OBJ_DIR32=arm32_mac OBJ_DIR64=arm64_mac

mkdir universal_mac
# lipo x86_iossdk/yoga.dylib x86_iossim/yoga.dylib -create -o x86_ios/yoga.dylib
lipo x64_mac/yoga.dylib arm64_mac/yoga.dylib -create -o universal_mac/yoga.dylib
