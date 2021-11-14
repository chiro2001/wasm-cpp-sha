call D:\\gits\\emsdk\\emsdk.bat construct_env 
call emcc -o build-wasm\sha-test.js src/main.cpp -Wall -O1 -s WASM=1 -s "EXTRA_EXPORTED_RUNTIME_METHODS=['ccall', 'UTF8ToString', 'cwrap', 'stringToUTF8Array', 'stringToUTF8', 'allocate', 'intArrayFromString', 'stringToAscii', 'ALLOC_NORMAL']" -s EXPORT_ES6=1 -s MODULARIZE=1 -s USE_ES6_IMPORT_META=0 -s ASSERTIONS=1 -s ALLOW_MEMORY_GROWTH=1 -g4 --source-map-base .
@REM http://localhost:8080/www/

copy build-wasm\sha-test.js www\sha-test.js
copy build-wasm\sha-test.wasm www\sha-test.wasm
if exist build-wasm\sha-test.wasm.map (
  copy build-wasm\sha-test.wasm.map www\sha-test.wasm.map
)
@REM start server 8080
@REM start http://localhost:8080/www/index.html