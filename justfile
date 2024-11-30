
set dotenv-load
set quiet

[private]
alias t := test

[private]
alias g := generate

domain_file := "${DATA_DIR}" / "domain-$TYPE-$COUNT.txt"

[private]
default:
  just --list

# Generate domain list for dnsperf testing.
generate:
    ./scripts/cloudflare.nu $INPUT_CSV -c $COUNT -o {{domain_file}}

# Run dnsperf test.
test:
    [ -f {{domain_file}} ] || just generate
    dnsperf -d {{domain_file}} -s $SERVER -p $PORT -m $MODE -c $CLIENT_COUNT -t $TIMEOUT

# Print server and port information.
info:
    echo "Server $SERVER"
    echo "Port: $PORT"

