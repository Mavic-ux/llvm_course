#pragma once

#include <iostream>
#include <map>
#include <string>
#include <vector>
#include <unordered_map>
#include <cstdint>
#include <memory>

enum class UnOp {
    Not,

    Output,
    Input,
};

enum class BinOp {
    Plus,
    Minus,
    Div,
    Mod,
    Mult,

    And,
    Or,
    Equal,
    NotEqual,
    Greater,
    Less,
    GreaterOrEqual,
    LessOrEqual,

    Assign,
};