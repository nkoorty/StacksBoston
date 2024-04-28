response=$(curl -L 'http://localhost:3999/extended/v1/address/ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5/nonces' -H 'Accept: application/json')
nonce=$(echo "$response" | jq -r '.possible_next_nonce')
echo $nonce

