#!/bin/bash
# Smoke Test Script for Rails API
# Tests basic functionality of all endpoints

BASE_URL="http://localhost:3000"
PASSED=0
FAILED=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

test_endpoint() {
    local name=$1
    local url=$2
    local method=${3:-GET}
    local expected_status=${4:-200}
    
    echo -e "\n${CYAN}Testing: $name${NC}"
    echo "  URL: $method $url"
    
    response=$(curl -s -o /dev/null -w "%{http_code}" -X $method "$url")
    
    if [ "$response" -eq "$expected_status" ]; then
        echo -e "  ${GREEN}✓ PASSED (Status: $response)${NC}"
        ((PASSED++))
        return 0
    else
        echo -e "  ${RED}✗ FAILED (Expected: $expected_status, Got: $response)${NC}"
        ((FAILED++))
        return 1
    fi
}

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}  Rails API Smoke Test${NC}"
echo -e "${YELLOW}========================================${NC}"

# Test Health Check
test_endpoint "Health Check" "$BASE_URL/health"

# Test Users
test_endpoint "List Users" "$BASE_URL/users?page=1&per_page=5"
test_endpoint "Get User" "$BASE_URL/users/11"

# Test Categories
test_endpoint "List Categories" "$BASE_URL/categories"

# Test Tags
test_endpoint "List Tags" "$BASE_URL/tags"

# Test Posts
test_endpoint "List Posts" "$BASE_URL/posts"
test_endpoint "Get Post" "$BASE_URL/posts/51"
test_endpoint "Filter Posts by User" "$BASE_URL/posts?user_id=11"
test_endpoint "Filter Posts by Category" "$BASE_URL/posts?category_id=14"
test_endpoint "Get Post Tags" "$BASE_URL/posts/51/tags"

# Test Comments
test_endpoint "List Comments for Post" "$BASE_URL/posts/51/comments"

echo -e "\n${YELLOW}========================================${NC}"
echo -e "${YELLOW}  Test Results${NC}"
echo -e "${YELLOW}========================================${NC}"
echo -e "  ${GREEN}Passed: $PASSED${NC}"
if [ $FAILED -eq 0 ]; then
    echo -e "  ${GREEN}Failed: $FAILED${NC}"
else
    echo -e "  ${RED}Failed: $FAILED${NC}"
fi
echo -e "${YELLOW}========================================${NC}"

if [ $FAILED -eq 0 ]; then
    echo -e "\n${GREEN}✓ All smoke tests passed!${NC}"
    exit 0
else
    echo -e "\n${RED}✗ Some tests failed!${NC}"
    exit 1
fi

