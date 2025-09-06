#include "finder.h"

int split_str(const std::string_view &base_str, char split_chr, std::vector<std::string_view> &out_str)
{
    size_t start = 0;
    size_t pos;

    while ((pos = base_str.find(split_chr, start)) != std::string_view::npos)
    {
        out_str.emplace_back(base_str.substr(start, pos - start));
        start = pos + 1;
    }

    out_str.emplace_back(base_str.substr(start));

    return out_str.size();
}

bool find_str(const std::string &base_str, const std::string &sub_str)
{
    std::vector<std::string_view> parts;
    split_str(sub_str, ' ', parts);

    for (const std::string_view &part : parts)
    {
        if (part.empty())
            continue;

        if (base_str.find(part) == std::string::npos)
            return false;
    }

    return true;
}