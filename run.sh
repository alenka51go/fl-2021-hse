bison -d parser.ypp
flex lexer.l
g++ -std=c++17  parser.tab.cpp lex.yy.c Graph.cpp
./a.out