#!/bin/bash

# Test script for dotfiles installation
# This script validates that the dotfiles are properly installed and working

set -e

echo "🧪 Testing dotfiles installation..."

# Test 1: Check if .bashrc symlink exists
if [ -L "$HOME/.bashrc" ]; then
    echo "✅ .bashrc symlink exists"
else
    echo "❌ .bashrc symlink not found"
    exit 1
fi

# Test 2: Check if symlink points to our bashrc
EXPECTED_TARGET="$(pwd)/bashrc"
ACTUAL_TARGET="$(readlink "$HOME/.bashrc")"
if [ "$ACTUAL_TARGET" = "$EXPECTED_TARGET" ]; then
    echo "✅ .bashrc symlink points to correct file"
else
    echo "❌ .bashrc symlink points to wrong file: $ACTUAL_TARGET (expected: $EXPECTED_TARGET)"
    exit 1
fi

# Test 3: Source bashrc and check vi mode
if bash -c "source ~/.bashrc && set -o | grep -q 'vi.*on'"; then
    echo "✅ Vi mode is enabled"
else
    echo "❌ Vi mode is not enabled"
    exit 1
fi

# Test 4: Check if aliases are defined
if bash -c "source ~/.bashrc && alias ll >/dev/null 2>&1"; then
    echo "✅ Aliases are defined"
else
    echo "❌ Aliases are not defined"
    exit 1
fi

# Test 5: Check if git aliases are defined
if bash -c "source ~/.bashrc && alias gs >/dev/null 2>&1"; then
    echo "✅ Git aliases are defined"
else
    echo "❌ Git aliases are not defined"
    exit 1
fi

echo "🎉 All tests passed! Dotfiles are properly installed and configured."