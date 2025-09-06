#ifndef FINDER_H
#define FINDER_H

#include <iostream>
#include <vector>
#include <string>
#include <string_view>
#include <cstring>

int split_str(const std::string_view &base_str, const char split_chr, std::vector<std::string_view> &out_str);
bool find_str(const std::string &base_str, const std::string &sub_str);

#endif