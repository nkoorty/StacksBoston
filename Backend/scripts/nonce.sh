response=$(curl -L 'http://localhost:3999/extended/v1/address/ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM/nonces' -H 'Accept: application/json')
nonce=$(echo "$response" | jq -r '.possible_next_nonce')
echo $nonce

