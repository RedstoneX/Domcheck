#!/bin/bash
# Original script inspiration from:
# https://linuxconfig.org/check-domain-name-availability-with-bash-and-whois
# https://gist.github.com/hotheadhacker/873519dea910b70bfc0137c527583056
# Using Chat GPT 4o to make improvements
# dependency: apt install whois
# Note On Mac "open -a zed domcheckv4.sh""

# Check if at least one domain name is provided
if [ "$#" -eq 0 ]; then
    echo "You need to supply at least one domain name!"
    exit 1
fi

echo "Checking domain availability..."

# Function to check if a domain is available
check_domain_availability() {
    local domain="$1"
    for tld in "${DOMAINS[@]}"; do
        local full_domain="${domain}${tld}"
        local whois_output=$(whois "$full_domain")
        if echo "$whois_output" | grep -q -iE 'no match|not found|no data found|no object found'; then
            echo "available: $full_domain"
        else
            echo "not available: $full_domain"
        fi
    done
}

# List of top-level domains (TLDs)
# DOMAINS=( '.com' '.net' '.info' '.mobi' '.us' '.ai' '.app' '.blog' '.org' '.co' '.tel' '.biz' '.cc' )

# List of top-level domains (TLDs)
DOMAINS=(
    '.com'
    '.net'
    '.org'
    '.info'
    '.mobi'
    '.us'
    '.ai'
    '.app'
    '.blog'
    '.co'
    '.tel'
    '.biz'
    '.cc'
    '.xyz'
    '.ca'
)
# Initialize arrays to store available and not available domains
available_domains=()
not_available_domains=()

# Iterate over each provided domain name
for domain; do
    while IFS= read -r result; do
        if [[ "$result" == available:* ]]; then
            available_domains+=("${result#available: }")
        else
            not_available_domains+=("${result#not available: }")
        fi
    done < <(check_domain_availability "$domain")
done

# Print the available domains
echo "Available Domains         Not Available Domains"
echo "------------------------- ------------------------"
max_length=25  # Maximum length for column width
for ((i=0; i<${#available_domains[@]} || i<${#not_available_domains[@]}; i++)); do
    printf "%-*s %s\n" "$max_length" "${available_domains[i]:-}" "${not_available_domains[i]:-}"
done
