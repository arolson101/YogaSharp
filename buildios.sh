# rm -rf x86_iossdk x64_iossdk x86_iossim x64_iossim x86_ios universal_ios
mkdir x86_iossdk x64_iossdk
make CC="$(xcrun --sdk iphoneos --find clang) -isysroot $(xcrun --sdk iphoneos --show-sdk-path) -arch arm64" OBJ_DIR32=x86_iossdk OBJ_DIR64=x64_iossdk

mkdir x86_iossim x64_iossim
make CC="$(xcrun --sdk iphonesimulator --find clang) -isysroot $(xcrun --sdk iphonesimulator --show-sdk-path) -arch x86_64" OBJ_DIR32=x86_iossim OBJ_DIR64=x64_iossim

mkdir universal_ios
# lipo x86_iossdk/yoga.dylib x86_iossim/yoga.dylib -create -o x86_ios/yoga.dylib
lipo x64_iossdk/yoga.dylib x64_iossim/yoga.dylib -create -o universal_ios/yoga.dylib
