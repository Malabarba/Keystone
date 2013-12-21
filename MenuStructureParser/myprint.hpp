#ifndef _COMMAND_
#define _COMMAND_

#include <iostream>
#define INFO (std::string("[") + __FILE__ + "]")

extern short VERBOSE_LEVEL;

// Name the Colors
struct TextColor{
  template <bool newline> static
  const char* mpnlImpl();

  const static unsigned short int None = -1;
  const static unsigned short int WN = 0;
  const static unsigned short int W = 1;
  const static unsigned short int G = 2;
  const static unsigned short int BB = 3;
  const static unsigned short int RB = 4;
  const static unsigned short int B = 5;
  const static unsigned short int EL = 6;
  const static unsigned short int GB = 7;

  template <unsigned short int c = None> static
  const char* GetString();
};

// Define the colors according to the system

#ifdef __unix__
template <> inline const char* TextColor::GetString <TextColor::WN>   (){return "\033[00m\n";}
template <> inline const char* TextColor::GetString <TextColor::W>    (){return "\033[00m";}
template <> inline const char* TextColor::GetString <TextColor::G>    (){return "\033[00;32m";}
template <> inline const char* TextColor::GetString <TextColor::GB>   (){return "\033[01;32m";}
template <> inline const char* TextColor::GetString <TextColor::BB>   (){return "\033[01;34m";}
template <> inline const char* TextColor::GetString <TextColor::RB>   (){return "\033[01;31m";}
template <> inline const char* TextColor::GetString <TextColor::B>    (){return "\033[01m";}
template <> inline const char* TextColor::GetString <TextColor::EL>   (){return " \033[00m";}
#else
template <> inline const char* TextColor::GetString <TextColor::EL>   (){return " ";}
template <> inline const char* TextColor::GetString <TextColor::WN>   (){return "\n";}
#endif
template <> inline const char* TextColor::GetString <TextColor::None> (){return "";}


template <> inline
const char* TextColor::mpnlImpl<true>(){return TextColor::GetString <TextColor::WN> ();}

template <> inline
const char* TextColor::mpnlImpl<false>(){return "";};


template <int v = 0, unsigned short int color = TextColor::RB, class T = void> inline
void mp(const T& text, typename std::enable_if< (v>=0) >::type* = 0){

  if(VERBOSE_LEVEL > v){
    std::cout << TextColor::GetString<color>()  
              << text
              << TextColor::GetString<TextColor::EL>() 
              << TextColor::GetString<TextColor::WN>();
  }

  return;
}

template <int v = 0, unsigned short int color = TextColor::RB, class T = void> inline
void mp(const T& text, typename std::enable_if< (v<0) >::type* = 0){

  if(VERBOSE_LEVEL == v){
    std::cout << TextColor::GetString<color>()  
              << text 
              << TextColor::GetString<TextColor::EL>() 
              << TextColor::GetString<TextColor::WN>();
  }

  return;
}


template <int v = 0, unsigned short int color = TextColor::RB, class T = void> inline
void mpe(const T& text, typename std::enable_if< (v>=0) >::type* = 0){

  if(VERBOSE_LEVEL > v){
    std::cout << TextColor::GetString<color>()  
              << text
              << TextColor::GetString<TextColor::EL>();
  }

  return;
}

template <int v = 0, unsigned short int color = TextColor::RB, class T = void> inline
void mpe(const T& text, typename std::enable_if< (v<0) >::type* = 0){

  if(VERBOSE_LEVEL == v){
    std::cout << TextColor::GetString<color>()  
              << text 
              << TextColor::GetString<TextColor::EL>();
  }

  return;
}


// struct NoLine {const static bool breakLine = false;};

// template <int v, class L, class T> inline
// void mp(const T& text){mp< v, TextColor::RB, L::breakLine, T>(text);}


typedef TextColor tc;

#endif
