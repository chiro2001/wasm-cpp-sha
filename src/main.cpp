#include <emscripten/emscripten.h>

#include <iostream>

#include "picosha2.h"

extern "C" {
EMSCRIPTEN_KEEPALIVE
char* test(char* str) {
  std::string src(str);
  auto result = picosha2::hash256_hex_string(src);
  char* r = (char*)malloc(sizeof(char) * (result.length() + 1));
  strcpy(r, result.c_str());
  return r;
}

EMSCRIPTEN_KEEPALIVE
std::string test_string(const std::string src) {
  return picosha2::hash256_hex_string(src);
  ;
}
}
